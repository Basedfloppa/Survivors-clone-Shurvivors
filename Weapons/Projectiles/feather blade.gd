extends Area2D

var level: int = 1
var hp: int
var speed: float
var damage: float
var knockback_amount: int
var attack_size: float

var target: Vector2 = Vector2.ZERO
var angle: Vector2 = Vector2.ZERO

var Player: PlayerClass

signal remove_from_array(object)

func _ready() -> void:
	angle = global_position.direction_to(target)
	rotation = angle.angle()
	match level:
		1:
			hp = 1
			speed = 100 * ( 1 + Player.projectile_speed)
			damage = 5 * Player.damage_multiply
			knockback_amount = 100
			attack_size = 1 * Player.attack_size
		2: 
			hp = 1
			speed = 100 * Player.projectile_speed
			damage = 5 * Player.damage_multiply
			knockback_amount = 100
			attack_size = 1 * Player.attack_size
		3:
			hp = 2
			speed = 100 * Player.projectile_speed
			damage = 8 * Player.damage_multiply
			knockback_amount = 100
			attack_size = 1 * Player.attack_size
		4:
			hp = 2
			speed = 100 * Player.projectile_speed
			damage = 10 * Player.damage_multiply
			knockback_amount = 100
			attack_size = 1 * Player.attack_size
	
	self.scale = Vector2.ZERO
	var tween = self.create_tween()
	tween.tween_property(self, "scale", Vector2(1,1) * attack_size, 1).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()

func _physics_process(delta) -> void: position += angle * speed * delta

func enemy_hit(charge = 1) -> void:
	hp -= charge
	if hp <= 0:
		emit_signal("remove_from_array", self)
		queue_free()

func _on_timer_timeout() -> void:
	emit_signal("remove_from_array", self)
	queue_free()
