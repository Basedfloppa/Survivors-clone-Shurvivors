extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.OnHit
@export var spd_boost: int = 100
@export var time: float = 5
@export var level: int = 0

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")
@onready var Speed_Timer: Timer = $Timer

func onhit() -> void:
	Speed_Timer.start()
	Player.speed += spd_boost

func _on_timer_timeout() -> void:
	Player.speed -= spd_boost

func upgrade() -> void:
	level += 1

	match(level):
		1: 
			spd_boost = 100
			time = 1.0
			Speed_Timer.wait_time = time
