extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.Passive
@export var radius: float = 100
@export var damage: float = 1
@export var level: int = 0

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")

func upgrade() -> void:
	level += 1

	match(level):
		1:
			radius = 100
			damage = 1
