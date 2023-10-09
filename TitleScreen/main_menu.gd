extends Control

var World1 = "res://Levels/World1.tscn"

func _on_play_button_pressed():
	var _level = get_tree().change_scene_to_file(World1)

func _on_exit_button_pressed():
	get_tree().quit()
