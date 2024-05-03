extends Node
class_name Upgrade

var upgrade_name: String
var icon_path: String
var display_upgrade_name: String
var description: String
var level: int
var prerequisite: Array[String]
var type: UpgradeDb.UpgradeType

func _init(
	_upgrade_name: String, _icon_path: String, 
	_display_upgrade_name: String, _description: String,
	_level: int, _prerequisite: Array[String], _type: UpgradeDb.UpgradeType
	) -> void:
	upgrade_name = _upgrade_name
	icon_path = _icon_path
	display_upgrade_name = _display_upgrade_name
	description = _description
	level = _level
	prerequisite = _prerequisite
	type = _type
