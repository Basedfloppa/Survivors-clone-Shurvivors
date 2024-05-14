extends CharacterBody2D

class_name Enemy_class

@export var spd: int = 50
@export var hp: int = 10
@export var knockback_recovery: float = 3.5
@export var expirience: int = 1

var knockback: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO
var animation_time: float = 0.0 

@onready var ExpGem := preload("res://loot/exp.tscn")
@onready var LootBase := get_tree().get_first_node_in_group("loot")
@onready var Player := get_tree().get_first_node_in_group("player")
@onready var EnemyTexture := $Enemy

signal remove_from_array(object)

func _process(delta) -> void:
	knockback = knockback.move_toward(Vector2.ZERO, knockback_recovery)
	direction = global_position.direction_to(Player.global_position)
	velocity = direction * spd
	
	if velocity.x < 0: EnemyTexture.flip_h = true
	if velocity.x > 0: EnemyTexture.flip_h = false
	if velocity != Vector2.ZERO:
		animation_time += delta
		EnemyTexture.rotation_degrees = sin(animation_time * 5) * 5
		EnemyTexture.scale.y = abs(sin(animation_time * 1) * 0.1) + 0.2
	
	velocity += knockback
	
	move_and_slide()

func _on_hurt_box_hurt(damage, angle, knockback_amount) -> void:
	hp -= damage
	knockback = angle * knockback_amount
	if hp <= 0:
		emit_signal("remove_from_array", self)
		var new_gem = ExpGem.instantiate()
		new_gem.global_position = Player.global_position
		new_gem.expirience = expirience
		LootBase.call_deferred("add_child",new_gem)
		queue_free()
