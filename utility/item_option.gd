extends ColorRect

@onready var lblname = $lbl_name
@onready var lbldescription = $lbl_description
@onready var lbllevel = $lbl_level
@onready var itemicon = $ColorRect/Icon

var mouse_over = false
var item = null
@onready var player = get_tree().get_first_node_in_group("player")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade", Callable(player,"upgrade_character"))
	if item == null:
		item = "cat"
	lblname.text = UpgradeDb.UPGRADES[item]["name"]
	lbldescription.text = UpgradeDb.UPGRADES[item]["description"]
	lbllevel.text = UpgradeDb.UPGRADES[item]["level"]
	itemicon.texture = load(UpgradeDb.UPGRADES[item]["icon"])

func _input(event):
	if event.is_action("click"):
		if mouse_over:
			emit_signal("selected_upgrade",item)

func _on_mouse_entered():
	mouse_over = true


func _on_mouse_exited():
	mouse_over = false
