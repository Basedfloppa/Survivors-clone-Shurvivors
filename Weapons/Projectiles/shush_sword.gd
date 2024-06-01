extends Node2D

var level: int
var damage: float

@onready var Player: PlayerClass

func _process(delta):
	print(int(self.rotation))

func _ready() -> void:
	var animation: Tween = create_tween()
	
	match(level):
		1:
			damage = 10 * Player.damage_multiply
			self.scale = Vector2(2 * Player.attack_size, 2 * Player.attack_size)
	
	if Player.sprite.flip_h == true:
		self.rotation_degrees = -130.0
		$Sword.flip_v = true
		animation.tween_property(self, "rotation_degrees", -230.0, 0.5)
	else:
		self.rotation_degrees = -50.0
		animation.tween_property(self, "rotation_degrees", 50.0, 0.5)
	
	animation.finished.connect(on_animation_ended)
	animation.play()

func on_animation_ended() -> void:
	self.queue_free()
