extends CharacterBody2D

@export var spd = 50

@onready var player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * spd
	move_and_slide()
