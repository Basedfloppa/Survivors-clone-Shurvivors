extends Node2D

@export var BackGround_path: String = "res://Sprites/backgrounds/grass.png"
@export var Gui_path: String = "res://Utility/GUI/world_gui.tscn"
@export var EnemySpawner_path: String = "res://Utility/World/enemy_spawner.tscn"

var Player_path: String = Global.ChoosenCharacter
var BackGround: Sprite2D = Sprite2D.new()
var Player: PlayerClass = load(Player_path).instantiate()
var Gui = load(Gui_path).instantiate()
var EnemySpawner = load(EnemySpawner_path).instantiate()

func _ready() -> void:
	BackGround.texture = load(BackGround_path)
	BackGround.texture_repeat = CanvasItem.TEXTURE_REPEAT_ENABLED
	BackGround.region_enabled = true
	BackGround.region_rect = Rect2(Vector2.ZERO,Vector2(1000000,1000000))
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
