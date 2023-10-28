extends Node2D

@export var BackGround_path = "res://Sprites/backgrounds/World_1_Background.tscn"
var Player_path = Global.ChoosenCharacter
@export var Gui_path = "res://Utility/GUI/world_gui.tscn"
@export var EnemySpawner_path = "res://Utility/World/enemy_spawner.tscn"

var BackGround = load(BackGround_path).instantiate()
var Player = load(Player_path).instantiate()
var Gui = load(Gui_path).instantiate()
var EnemySpawner = load(EnemySpawner_path).instantiate()


func _ready():
	add_child(BackGround)
	
	var start_exp = load("res://Loot/exp.tscn").instantiate()
	add_child(start_exp)
	
	var camera = Camera2D.new()
	camera.name = "World1Camera"
	camera.zoom.x = 0.25
	camera.zoom.y = 0.25
	
	add_child(Gui)
	
	add_child(Player)
	Player.add_child(camera)
	
	add_child(EnemySpawner)
