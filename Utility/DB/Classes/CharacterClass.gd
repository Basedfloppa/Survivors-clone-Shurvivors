extends Node
class_name Character

var char_name: String
var path: String
var icon: String
var description: String

func _init(_char_name: String, _path: String,
		   _icon: String, _description: String
		  ) -> void:
	char_name = _char_name
	path = _path
	icon = _icon
	description = _description
