extends Node2D

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
	}
}
