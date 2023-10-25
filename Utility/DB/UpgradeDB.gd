extends Node2D

const ICON_PATH = "res://sprites/items/"
const WEAPON_PATH = "res://sprites/weapons/"
const UPGRADES = {
	"featherblade1": {
		"icon": WEAPON_PATH + "feather_blade.png",
		"name": "Feather Blade",
		"description": "Sharp crow feather",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"featherblade2": {
		"icon": WEAPON_PATH + "feather_blade.png",
		"name": "Feather Blade",
		"description": "More feathers",
		"level": "Level: 2",
		"prerequisite": ["featherblade1"],
		"type": "weapon"
	},
	"featherblade3": {
		"icon": WEAPON_PATH + "feather_blade.png",
		"name": "Feather Blade",
		"description": "pass through one enemy and +3 damage",
		"level": "Level: 3",
		"prerequisite": ["featherblade2"],
		"type": "weapon"
	},
	"featherblade4": {
		"icon": WEAPON_PATH + "feather_blade.png",
		"name": "Feather Blade",
		"description": "An additional 2 are thrown",
		"level": "Level: 4",
		"prerequisite": ["featherblade3"],
		"type": "weapon"
	},
	"fuckingexplosion": {
		"icon": WEAPON_PATH + "fuckingexplosion.png",
		"name": "Fucking Explosion",
		"description": "Explodes.",
		"level": "Level: 1",
		"prerequisite": [],
		"type": "weapon"
	},
	"cat": {
		"icon": ICON_PATH + "cat.png",
		"name": "Cat",
		"description": "heals 20hp",
		"level": "N/A",
		"prerequisite": [],
		"type": "item"
	}
}
