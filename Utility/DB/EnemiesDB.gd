extends Node

enum EnemyTypes {
	Zlokot_base,
	Taxes_base,
	Death,
	Evil_fox
}

@export var _Enemies: Array[Enemy] = [
	Enemy.new(
		"Zlokot_base", #Name
		"res://Enemies/zlokot.tscn" #Path
	),
	Enemy.new(
		"Taxes_base", #Name
		"res://Enemies/taxes.tscn" #Path
	),
	Enemy.new(
		"Death",
		"res://Enemies/death.tscn"
	),
	Enemy.new(
		"Evil_fox",
		"res://Enemies/evil_fox.tscn"
	)
]
