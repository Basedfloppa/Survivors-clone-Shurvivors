extends Control

@onready var Parent = get_node("/root/MainMenu/Character_Cards")

@export var Des: String = ""
@export var Icon: String = ""
@export var Char: String = ""

func _ready() -> void:
	$TextureRect.texture = load(Icon)
	$RichTextLabel.text = Des

func _on_button_pressed() -> void:
	Global.ChoosenCharacter = Char
	var tween = Parent.create_tween()
	tween.tween_property(Parent,"position",Vector2(640,26),1)
	tween.play()
