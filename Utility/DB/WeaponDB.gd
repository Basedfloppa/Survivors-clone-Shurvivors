extends Node

enum WeaponType {
	Attack,
	OnHit,
	Passive,
	Event
}

const WEAPON_PATH = "res://Weapons/"

const Weapon = {
	"featherblade": {
		"path": WEAPON_PATH + "feather_blade_weapon.tscn"
	},
	"fuckingexplosion": {
		"path": WEAPON_PATH + "fucking_explosion.tscn"
	},
	"skirt": {
		"path": WEAPON_PATH + "skirt.tscn"
	},
	"cloak": {
		"path": WEAPON_PATH + "cloak.tscn"
	},
	"breeches": {
		"path": WEAPON_PATH + "breeches.tscn"
	},
	"dice": {
		"path": WEAPON_PATH + "dice.tscn"
	}
}
