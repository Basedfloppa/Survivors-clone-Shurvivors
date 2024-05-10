extends Node

enum Enemies {
	Zlokot_base
}

@export var _Enemies: Array[Enemy] = [
	Enemy.new(
		"Zlokot_base", #Name
		"res://Enemies/zlokot.tscn" #Path
	)
]
