extends Node2D

@export var GUI = ""
@export var Spawner = ""
@export var Player = ""
@export var Camera = ""
@export var Loot = ""
@export var Background = ""

func _ready():
	var player = load(Player).instantiate()
	var gui = load(GUI).instantiate()
	var spawner = load(Spawner).instantiate()
	var camera = load(Camera).instantiate()
	var background = load(Background).instantiate()
	
	add_child(gui)
	add_child(spawner)
	add_child(player)
	player.add_child(camera)
	add_child(Loot)
	add_child(background)
