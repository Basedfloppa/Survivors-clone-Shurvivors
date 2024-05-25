extends Node2D

@export var type: WeaponDb.WeaponType = WeaponDb.WeaponType.Passive
@export var level: int = 0

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")

var upgrade_type = ["max_hp","armor","speed","proj_spd","cooldown","size","attacks","dmg","luck"]

func upgrade() -> void:
	level += 1

	match(upgrade_type.pick_random()):
		"max_hp":
			Player.max_hp += 1
			Player.HealthBar.max_value += 1
		"armor":
			Player.armor += 1
		"speed":
			Player.speed += 1
		"proj_spd":
			Player.projectile_speed += 1
		"cooldown":
			Player.attack_cooldown += 1
		"size":
			Player.attack_size += 1
		"attacks":
			Player.additional_attacks += 1
		"dmg":
			Player.damage_multiply += 1
		"luck":
			Player.luck += 1
