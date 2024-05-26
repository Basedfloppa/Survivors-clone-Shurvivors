extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.Attack
@export var attackspeed: float = 10
@export var level: int = 0

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")
@onready var timer: Timer = $Timer
@onready var Sword := preload("res://Weapons/Projectiles/shush_sword.tscn")


func _ready() -> void: attack()

func attack() -> void:
	if level > 0:		
		if timer.is_stopped():
			timer.wait_time = attackspeed * (1 + (Player.attack_cooldown * 0.1))
			timer.start()

func _on_timer_timeout() -> void:
	var sword: Node = Sword.instantiate()

	sword.level = level
	sword.Player = Player
	
	self.add_child(sword)
	timer.start()
