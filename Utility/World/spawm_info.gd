extends Resource

class_name spawn_info

@export var time_start:int
@export var time_end:int
@export var enemy: EnemiesDb.Enemies
@export var enemy_num:int
@export var enemy_spawn_delay:int

var spawn_delay_counter: float = 0
