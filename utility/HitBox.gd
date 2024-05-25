extends Area2D

class_name hit_box_class

@export var damage: int = 1
@onready var collision: CollisionShape2D = $Collision
@onready var disable_timer: Timer = $DisableTimer

func temp_disable() -> void:
	collision.call_deferred("set","disabled",true)
	disable_timer.start()

func _on_disable_hit_box_timer_timeout() -> void:
	collision.call_deferred("set","disabled",false)
