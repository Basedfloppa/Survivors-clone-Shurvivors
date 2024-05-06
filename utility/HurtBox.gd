extends Area2D

@export_enum('Cooldown','HitOnce','DisableHitBox') var HurtBoxType: int = 0

@onready var collision: CollisionShape2D = $Collision
@onready var disable_timer: Timer = $DisableTimer

var hit_once_array: Array[Node] = []

signal hurt(damage, angle, knockback)

func _on_area_entered(area) -> void:
	if area.is_in_group("attack"):
		if area.get("damage") != null:
			match HurtBoxType:
				0: #Cooldown
					collision.call_deferred("set","disabled",true)
					disable_timer.start()
				1: #HitOnce
					if hit_once_array.has(area) == false:
						hit_once_array.append(area)
						if area.has_signal("remove_from_array"):
							area.connect("remove_from_array", Callable(self,"remove_from_array"))
				2: #DisableHitBox
					area.call_deferred("temp_disable")
			
			var angle: Vector2 = Vector2.ZERO if (area.get("angle") == null) else area.angle
			var knockback: int = 1 if (area.get("knockback_amount") == null) else area.knockback_amount
			
			if area.has_method("enemy_hit"): area.enemy_hit(1)

			emit_signal("hurt", area.damage, angle, knockback)

func remove_from_array(object) -> void:
	if hit_once_array.has(object): hit_once_array.erase(object)

func _on_disable_timer_timeout() -> void:
	collision.call_deferred("set","disabled",false)
