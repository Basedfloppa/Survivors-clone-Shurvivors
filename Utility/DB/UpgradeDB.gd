extends Node

enum UpgradeType {
	Weapon,
	Item,
	Passive
}

const ICON_PATH: String = "res://sprites/items/"
const WEAPON_PATH: String = "res://sprites/weapons/"

var UPGRADES: Array[Upgrade] = [
	Upgrade.new(
		"featherblade1", #Internal name
		WEAPON_PATH + "feather_blade.png", #Icon path
		"Feather Blade", #Discplay name
		"Sharp crow feather", #Description
		1, #Level of upgrade
		[], #Prerequisites (array of strings)
		UpgradeType.Weapon #Enum type of upgrade
	),
	Upgrade.new(
		"featherblade2",
		WEAPON_PATH + "feather_blade.png",
		"Feather Blade",
		"More feathers",
		2,
		["featherblade1"],
		UpgradeType.Weapon
	),
	Upgrade.new(
		"featherblade3",
		WEAPON_PATH + "feather_blade.png",
		"Feather Blade",
		"pass through one enemy and +3 damage",
		3,
		["featherblade2"],
		UpgradeType.Weapon
	),
	Upgrade.new(
		"featherblade4",
		WEAPON_PATH + "feather_blade.png",
		"Feather Blade",
		"An additional 2 are thrown",
		4,
		["featherblade3"],
		UpgradeType.Weapon
	),
	Upgrade.new(
		"fuckingexplosion",
		WEAPON_PATH + "fuckingexplosion.png",
		"Fucking Explosion",
		"Explodes.",
		1,
		[],
		UpgradeType.Weapon
	),
	Upgrade.new(
		"cat", #Internal name
		ICON_PATH + "cat.png", #Icon path
		"Cat", #Discplay name
		"heals 20hp", #Description
		0, #Level of upgrade
		[], #Prerequisites (array of strings)
		UpgradeType.Item #Enum type of upgrade 
	)
]
