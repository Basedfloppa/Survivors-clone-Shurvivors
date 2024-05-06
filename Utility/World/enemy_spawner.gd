extends Node2D

@export var spawns: Array[spawn_info] = []

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")
@onready var WorldTimer: Label = $"../WorldGUI/GUI/WorldTimer"

var time: int = 0

func _on_timer_timeout() -> void:
	time += 1
	
	for i in spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				for j in i.enemy_num:
					var enemy_spawn: Node = i.enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
	change_time()

func get_random_position() -> Vector2:
	var view_port: Vector2 = get_viewport_rect().size * randf_range(2,2.5)
	
	var top_left: Vector2 = Vector2(Player.global_position.x - view_port.x, Player.global_position.y - view_port.y)
	var top_right: Vector2 = Vector2(Player.global_position.x + view_port.x, Player.global_position.y - view_port.y)
	var bottom_left: Vector2 = Vector2(Player.global_position.x - view_port.x, Player.global_position.y + view_port.y)
	var bottom_right: Vector2 = Vector2(Player.global_position.x + view_port.x, Player.global_position.y + view_port.y)
	
	var pos_side: String = ["up","down","right","left"].pick_random()
	
	var spawn_pos1: Vector2 = Vector2.ZERO
	var spawn_pos2: Vector2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn: float = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn: float = randf_range(spawn_pos1.y, spawn_pos2.y)
	
	return Vector2(x_spawn, y_spawn)

func change_time() -> void:
	var get_m = int(time / 60)
	var get_s = int(time % 60)
	
	if get_m < 10: get_m = str(0, get_m)
	if get_s < 10: get_s = str(0, get_s)
	
	WorldTimer.text = str(get_m,":",get_s)
