extends TextureRect

var upgrade: Upgrade

func _ready():
	if upgrade:
		%ItemTexture.texture = load(upgrade.icon_path)

