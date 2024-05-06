extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.OnHit
@export var radius: int = 100
@export var damage: int = 999

var size: Vector2 = Vector2(radius,radius)

func _ready(): self.scale = Vector2.ZERO

func _process(_delta) -> void:
	if self.scale == Vector2(radius,radius):
		var tween_in := self.create_tween()
		tween_in.tween_property(self,"scale",Vector2.ZERO,2)
		tween_in.play()

func onhit() -> void:
	if self.scale < Vector2(0.001,0.001):
		var tween_out := self.create_tween()
		tween_out.tween_property(self,"scale",size,2)
		tween_out.play()
