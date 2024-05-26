extends Node2D

var level: int = 1
var damage: float = 1


@onready var animation: Tween = get_tree().create_tween()
@onready var Player: PlayerClass

func _ready() -> void:
	if Player.sprite.flip_h == true:
		self.rotation = -130
		$Sword.flip_v = true
		animation.tween_property(self, "rotation", 50, 2.0)
	else:
		self.rotation = -50
		animation.tween_property(self, "rotation", 130, 2.0)
	
	match(level):
		1:
			damage = 1 * Player.damage_multiply
			self.scale = Vector2(1 * Player.attack_size, 1 * Player.attack_size)
	
	animation.finished.connect(on_animation_ended)
	animation.play()

func on_animation_ended() -> void:
	self.queue_free()
