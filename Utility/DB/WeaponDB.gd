extends Node

const WEAPON_PATH = "res://Weapons/"
enum WeaponType {
	Attack,
	OnHit,
	Passive,
	Event
}
const Weapon = {
	"featherblade": {
		"path": WEAPON_PATH + "feather_blade_weapon.tscn"
	},
	"fuckingexplosion": {
		"path": WEAPON_PATH + "fucking_explosion.tscn"
	}
}
