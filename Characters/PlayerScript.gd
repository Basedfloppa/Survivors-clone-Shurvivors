extends CharacterBody2D

# Expirience
var expirience = 0
var expirience_level = 1
var collected_expirience = 0

# GUI
@onready var Weapons = $Weapons

@onready var ExpBar = $"../WorldGUI/GUI/ExpBar"
@onready var ExpLevel = $"../WorldGUI/GUI/ExpBar/ExpLevel"

@onready var LevelUpPanel = $"../WorldGUI/GUI/LevelUp"
@onready var UpgradeOptions = $"../WorldGUI/GUI/LevelUp/UpgradeOptions"

@onready var ResultText = $"../WorldGUI/GUI/DeathPanel/ResultText"
@onready var DeathPanel = $"../WorldGUI/GUI/DeathPanel"

@onready var CollectedWeapons = $"../WorldGUI/GUI/CollectedWeapons"
@onready var CollectedUpgrades = $"../WorldGUI/GUI/CollectedUpgrades"

@onready var HealthBar = get_node("%HealthBar")

@onready var ItemOptions = preload("res://utility/item_option.tscn")
@onready var ItemContainer = preload("res://utility/GUI/item_container.tscn")

# Upgrades
var weapons_list = {}
var collected_upgrades = []
var upgrade_options = []
var hp = 100
var max_hp = 100
var armor = 0
var speed = 100
var attack_cooldown = 0
var attack_size = 0
var additional_attacks = 0
var damage_multiply = 1.0
var luck = 0

# Target selection
var enemy_close = []

# Animation
@onready var sprite = $PlayerSprite
var time = 0.0

func _ready():
	attack()
	
	set_exp_bar(expirience, calculate_expirience_cap())
	_on_hurt_box_hurt(0, 0, 0)

func _process(_delta):
	movement(_delta)

func movement(delta):
	var x_str = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_str = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_str,y_str)
	
	if mov.x < 0:
		sprite.flip_h = true
	if mov.x > 0:
		sprite.flip_h = false

	if mov != Vector2.ZERO:
		time += delta
		sprite.rotation_degrees = sin(time * 5) * 5
	
	velocity = mov.normalized() * speed
	
	move_and_slide() 

func attack():
	for i in Weapons.get_children():
		if i.type == WeaponDb.WeaponType.Attack && i.has_method("attack"):
			i.attack()

func _on_hurt_box_hurt(damage, _angle, _knockback):
	hp -= clamp(damage - armor, 1.0, max_hp * max_hp)
	HealthBar.max_value = max_hp
	HealthBar.value = hp 
	
	for i in Weapons.get_children():
		if i.type == WeaponDb.WeaponType.OnHit && i.has_method("onhit"):
			i.onhit()
	
	if hp <= 0:
		death()

func get_random_target():
	if enemy_close.size() > 0:
		return enemy_close.pick_random().global_position
	else:
		return Vector2.UP

func _on_enemy_detection_area_body_entered(body):
	if not enemy_close.has(body):
		enemy_close.append(body)

func _on_enemy_detection_area_body_exited(body):
	if enemy_close.has(body):
		enemy_close.erase(body)

func _on_grab_area_area_entered(area):
	if area.is_in_group("loot"):
		area.target = self

func _on_collect_area_area_entered(area):
	if area.is_in_group("loot"):
		var gem_exp = area.collect()
		calculate_expirience(gem_exp)

func calculate_expirience(gem_exp):
	var exp_required = calculate_expirience_cap()
	
	collected_expirience += gem_exp
	
	if expirience + collected_expirience >= exp_required: #lvl up
		collected_expirience -= exp_required - expirience
		expirience_level += 1
		expirience = 0
		exp_required = calculate_expirience_cap()
		
		lvlup()
		calculate_expirience(0)
	else: 
		expirience += collected_expirience
		collected_expirience = 0
	
	set_exp_bar(expirience, exp_required)

func calculate_expirience_cap():
	var exp_cap = expirience_level
	
	if expirience_level < 20:
		exp_cap = expirience_level * 5
	elif expirience_level < 40:
		exp_cap = exp_cap + 95 + (expirience_level - 19) * 8
	else:
		exp_cap = 255 + (expirience_level - 39) * 12
	
	return exp_cap

func set_exp_bar(value = 1, max_value = 100):
	ExpBar.value = value
	ExpBar.max_value = max_value

func lvlup():
	ExpLevel.text = str("Level: ",expirience_level)
	
	var tween = LevelUpPanel.create_tween()
	tween.tween_property(LevelUpPanel,"position", Vector2(220,50),0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play
	
	LevelUpPanel.visible = true
	var options = 0
	var options_max = 3
	
	if (randi_range(0,100) + luck) >= 100:
		options_max += 1
	
	while options < options_max:
		var option_choise = ItemOptions.instantiate()
		option_choise.item = get_random_item()
		UpgradeOptions.add_child(option_choise)
		options += 1
	get_tree().paused = true

func upgrade_character(upgrade):
	match upgrade:
		"featherblade1":
			var feather = load(WeaponDb.Weapon["featherblade"]["path"]).instantiate()
			feather.feather_level = 1
			feather.feather_baseammo += 1
			
			weapons_list["FeatherBlade"] = feather
			Weapons.add_child(feather)
		"featherblade2":
			weapons_list["FeatherBlade"].feather_level = 2
			weapons_list["FeatherBlade"].feather_baseammo += 1
		"featherblade3":
			weapons_list["FeatherBlade"].feather_level = 3
		"featherblade4":
			weapons_list["FeatherBlade"].feather_level = 4
			weapons_list["FeatherBlade"].feather_baseammo += 2
		"fuckingexplosion":
			var explosion = load(WeaponDb.Weapon["fuckingexplosion"]["path"]).instantiate()
			
			weapons_list["fuckingexplosion"] = explosion
			Weapons.add_child(explosion)
		"cat":
			hp += 20
			hp = clamp(hp, 0, max_hp)
	
	adjust_gui_collection(upgrade)
	attack()
	
	var option_children = UpgradeOptions.get_children()
	
	for i in option_children:
		i.queue_free()
	
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	
	LevelUpPanel.visible = false
	LevelUpPanel.position = Vector2(800,50)
	
	get_tree().paused = false
	calculate_expirience(0)

func get_random_item():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades: # if upgrade already collected
			pass
		elif i in upgrade_options: # if upgrade already in options
			pass
		elif UpgradeDb.UPGRADES[i]["type"] == "item": # dont pick food
			pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0: #check prerequisites
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					dblist.append(i)
		else:
			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist.pick_random()
		upgrade_options.append(randomitem)
		return randomitem
	else:
		return null

func adjust_gui_collection(upgrade):
	var get_upgraded_displaynames = UpgradeDb.UPGRADES[upgrade]["name"]
	var get_type = UpgradeDb.UPGRADES[upgrade]["type"]
	
	if get_type != "item":
		var get_collected_displaynames = []
		
		for i in collected_upgrades:
			get_collected_displaynames.append(UpgradeDb.UPGRADES[i]["name"])
		
		if not get_upgraded_displaynames in get_collected_displaynames:
			var new_item = ItemContainer.instantiate()
			
			new_item.upgrade = upgrade
			
			match get_type:
				"weapon":
					CollectedWeapons.add_child(new_item)
				"upgrade":
					CollectedUpgrades.add_child(new_item)

func death():
	DeathPanel.visible = true
	get_tree().paused = true
	
	var tween = DeathPanel.create_tween()
	tween.tween_property(DeathPanel, "position", Vector2(220,50), 3).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
	
	var timer = $"../WorldGUI/GUI/WorldTimer"
	var times = timer.text.split(':')
	var time = (int(times[0]) * 60) + int(times[1])
	
	if time >= 300:
		ResultText.text = "You Win :)"
	else:
		ResultText.text = "You Lose :("
