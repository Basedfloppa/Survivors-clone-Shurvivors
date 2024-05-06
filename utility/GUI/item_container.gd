extends TextureRect

var upgrade: Upgrade

func _ready() -> void:
	if upgrade: %ItemTexture.texture = load(upgrade.icon_path)

