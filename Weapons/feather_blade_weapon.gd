extends Node2D

@export var type = WeaponDb.WeaponType.Attack
@export var feather_ammo = 0
@export var feather_baseammo = 0
@export var feather_attackspeed = 1.5
@export var feather_level = 0

@onready var Player = get_tree().get_first_node_in_group("player")
@onready var FeatherTimer = $FeatherTimer
@onready var FeatherAttackTimer = $FeatherTimer/FeatherAttackTimer
@onready var Feather = preload("res://Weapons/Projectiles/feather blade.tscn")

func _ready():
	attack()

func attack():
	if feather_level > 0:
		FeatherTimer.wait_time = feather_attackspeed * (1 - Player.attack_cooldown)
		
		if FeatherTimer.is_stopped():
			FeatherTimer.start()

func _on_feather_timer_timeout():
	feather_ammo += feather_baseammo + Player.additional_attacks
	FeatherAttackTimer.start()

func _on_feather_attack_timer_timeout():
	if feather_ammo > 0:
		var feather_attack = Feather.instantiate()
		
		feather_attack.position = global_position
		feather_attack.target = Player.get_random_target()
		feather_attack.level = feather_level
		
		Player.add_child(feather_attack)
		
		feather_ammo -= 1
		
		if feather_ammo > 0:
			FeatherAttackTimer.start()
		else:
			FeatherAttackTimer.stop()
