extends ColorRect

@onready var Player: PlayerClass = get_tree().get_first_node_in_group("player")
@onready var NameLablel: Label = %Name
@onready var DescriptionLablel: Label = %Description
@onready var LevelLablel: Label = %Level
@onready var ItemIcon: TextureRect = %Icon

var mouse_over: bool
var item: Upgrade

signal selected_upgrade(upgrade)

func _ready() -> void:
	connect("selected_upgrade", Callable(Player,"upgrade_character"))
	
	NameLablel.text = item.display_upgrade_name
	DescriptionLablel.text = item.description
	LevelLablel.text = "Level: " + str(item.level)
	ItemIcon.texture = load(item.icon_path)

func _input(event) -> void:
	if event.is_action("click") && mouse_over:
			emit_signal("selected_upgrade",item)

func _on_mouse_entered() -> void: mouse_over = true

func _on_mouse_exited() -> void: mouse_over = false
