extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.Attack
@export var feather_ammo: int = 0
@export var feather_baseammo: int = 0
@export var feather_attackspeed: float = 1.5
@export var feather_level: int = 0

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")
@onready var FeatherTimer: Timer = $FeatherTimer
@onready var FeatherAttackTimer: Timer = $FeatherTimer/FeatherAttackTimer
@onready var Feather := preload("res://Weapons/Projectiles/feather blade.tscn")

func _ready() -> void: attack()

func attack() -> void:
	if feather_level > 0:		
		if FeatherTimer.is_stopped():
			FeatherTimer.wait_time = feather_attackspeed * (1 - Player.attack_cooldown)
			FeatherTimer.start()

func _on_feather_timer_timeout() -> void:
	feather_ammo += feather_baseammo + Player.additional_attacks
	FeatherAttackTimer.start()

func _on_feather_attack_timer_timeout() -> void:
	if feather_ammo > 0:
		var feather_attack: Node = Feather.instantiate()
		
		feather_attack.position = global_position
		feather_attack.target = Player.get_random_target()
		feather_attack.level = feather_level
		feather_attack.Player = Player
		
		Player.add_child(feather_attack)
		
		feather_ammo -= 1
		
		if feather_ammo > 0: FeatherAttackTimer.start()
		else: FeatherAttackTimer.stop()
