extends Control

var card_path = "res://Utility/GUI/character_card.tscn"

func _ready():
	var counter = 5
	var tab_container = $TabContainer
	var current_tab = TabBar.new()
	var current_box = VBoxContainer.new()
	
	current_tab.name = "1"
	
	current_tab.add_child(current_box)
	tab_container.add_child(current_tab)
	
	for i in CharactersDb.Characters:
		var card = load(card_path).instantiate()
		
		card.Des = CharactersDb.Characters[i]["description"]
		card.Char = CharactersDb.Characters[i]["path"]
		card.Icon = CharactersDb.Characters[i]["icon"]
		
		current_box.add_child(card)
		counter -= 1
		
		if counter == 0:
			var new_name = current_tab.name + 1
			
			counter = 5
			
			current_tab = TabBar.new()
			current_box = VBoxContainer.new()
			
			current_tab.add_child(current_box)
			tab_container.add_child(current_tab)
			
			current_tab.name = new_name
