extends Node

enum EnemyTypes {
	Zlokot_base,
	Taxes_base
}

@export var _Enemies: Array[Enemy] = [
	Enemy.new(
		"Zlokot_base", #Name
		"res://Enemies/zlokot.tscn" #Path
	),
	Enemy.new(
		"Taxes_base", #Name
		"res://Enemies/taxes.tscn" #Path
	)
]
