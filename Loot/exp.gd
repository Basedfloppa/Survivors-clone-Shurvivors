extends Area2D

@export var expirience = 1
@export var target = self

func collect():
	return expirience

func _on_timer_timeout():
	queue_free()
