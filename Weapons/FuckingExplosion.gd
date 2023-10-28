extends Node2D

@export var type = WeaponDb.WeaponType.OnHit
@export var radius = 100
var size = Vector2(radius,radius)
@export var damage = 999

func _ready():
	self.scale = Vector2.ZERO

func _process(delta):
	if self.scale == Vector2(radius,radius):
		var tween_in = self.create_tween()
		tween_in.tween_property(self,"scale",Vector2.ZERO,2)
		tween_in.play()

func onhit():
	if self.scale < Vector2(0.001,0.001):
		var tween_out = self.create_tween()
		tween_out.tween_property(self,"scale",size,2)
		tween_out.play
