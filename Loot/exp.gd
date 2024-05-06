extends Area2D

@export var expirience: int = 1
@export var target: Node = self

func collect() -> int: return expirience

func _on_timer_timeout() -> void: queue_free()
