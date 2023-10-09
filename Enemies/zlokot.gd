extends CharacterBody2D

@export var spd = 50
@export var hp = 10
@export var knockback_recovery = 3.5
@export var expirience = 1

var knockback = Vector2.ZERO

@onready var exp_gem = preload("res://loot/exp.tscn")
@onready var loot_base = get_tree().get_first_node_in_group("loot")
@onready var player = get_tree().get_first_node_in_group("player")

signal remove_from_array(object)

func _process(_delta):
	knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * spd
	velocity += knockback
	move_and_slide()


func _on_hurt_box_hurt(damage, angle, knockback_amount):
	hp -= damage
	knockback = angle * knockback_amount
	if hp <= 0:
		emit_signal("remove_from_array", self)
		var new_gem = exp_gem.instantiate()
		new_gem.global_position = player.global_position
		new_gem.expirience = expirience
		loot_base.call_deferred("add_child",new_gem)
		queue_free()
