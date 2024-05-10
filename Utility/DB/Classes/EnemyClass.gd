extends Node
class_name Enemy

var enemy_name: String
var path: String

func _init(_enemy_name: String, _path: String) -> void:
	enemy_name = _enemy_name
	path = _path
