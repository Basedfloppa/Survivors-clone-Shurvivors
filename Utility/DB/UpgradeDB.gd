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
		"speed",
		ICON_PATH + "sanic.png",
		"Sanic essence",
		"+20 speed",
		0,
		[],
		UpgradeType.Item
	),
	Upgrade.new(
		"blanket",
		ICON_PATH + "icon.svg",
		"Warm blanket",
		"+1 armor",
		0,
		[],
		UpgradeType.Item
	),
	Upgrade.new(
		"coffe",
		ICON_PATH + "icon.svg",
		"Fresh coffe",
		"-1 to attak cooldown",
		0,
		[],
		UpgradeType.Item
	),
	Upgrade.new(
		"ring",
		ICON_PATH + "icon.svg",
		"Lucky ring",
		"+1 to luck",
		0,
		[],
		UpgradeType.Item
	),
	Upgrade.new(
		"tea",
		ICON_PATH + "icon.svg",
		"Fresh tea",
		"+5 to max hp",
		0,
		[],
		UpgradeType.Item
	),
	Upgrade.new(
		"skirt",
		ICON_PATH + "icon.svg",
		"Flowery skirt",
		"attaks everyone in a radius",
		0,
		[],
		UpgradeType.Passive
	),
	Upgrade.new(
		"cloak",
		ICON_PATH + "icon.svg",
		"Feather cloak",
		"gives temporary boost to speed when hit",
		0,
		[],
		UpgradeType.Passive
	),
	Upgrade.new(
		"breeches",
		ICON_PATH + "icon.svg",
		"Steel reinforced breeches",
		"decreeses speed but upgrades armor",
		0,
		[],
		UpgradeType.Passive
	),
	Upgrade.new(
		"dice",
		ICON_PATH + "icon.svg",
		"Dice of randomnes",
		"upgrades random characteristic by 1",
		0,
		[],
		UpgradeType.Passive
	),
	Upgrade.new(
		"shush_sword",
		WEAPON_PATH + "sword.webp",
		"Shusha's sword",
		"Deals moderate damage in aoe cone in front of character",
		0,
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
