extends Control

@onready var Parent = $"../../../.."

@export var Des = ""
@export var Icon = ""
@export var Char = ""

func _ready():
	$TextureRect.texture = load(Icon)
	$RichTextLabel.text = Des

func _on_button_pressed():
	Global.ChoosenCharacter = Char
	var tween = Parent.create_tween()
	tween.tween_property(Parent,"position",Vector2(640,0),1)
	tween.play()
