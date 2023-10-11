extends Node2D

@export var spawns: Array[Spawn_Info] = []

@onready var player = get_tree().get_first_node_in_group("player")

@onready var WorldTimer = $"../WorldGUI/GUI/WorldTimer"

var time = 0

func _on_timer_timeout():
	time += 1
	
	var enemy_spawns = spawns
	
	for i in enemy_spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = i.enemy
				var counter = 0
				while counter < i.enemy_num:
					var enemy_spawn = new_enemy.instantiate()
					enemy_spawn.global_position = get_random_position()
					add_child(enemy_spawn)
					counter += 1
	change_time()

func get_random_position():
	var vpr = get_viewport_rect().size * randf_range(2,2.5)
	var top_left = Vector2(player.global_position.x - vpr.x, player.global_position.y - vpr.y)
	var top_right = Vector2(player.global_position.x + vpr.x, player.global_position.y - vpr.y)
	var bottom_left = Vector2(player.global_position.x - vpr.x, player.global_position.y + vpr.y)
	var bottom_right = Vector2(player.global_position.x + vpr.x, player.global_position.y + vpr.y)
	var pos_side = ["up","down","right","left"].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
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
	
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	
	return Vector2(x_spawn, y_spawn)

func change_time():
	var get_m = int(time/60)
	var get_s = int(time % 60)
	
	if get_m < 10:
		get_m = str(0, get_m)
	
	if get_s < 10:
		get_s = str(0, get_s)
	
	WorldTimer.text = str(get_m,":",get_s)
