extends Area

var dialog_path = "res://Chars/Forno/Forno.json"

func _ready():
	pass

func get_dialogue_path():
	return dialog_path

func get_portrait():
	var portrait = "res://Chars/Forno/Forno.png"
	return portrait

func get_initial_index():
	var index = "001"
	
	return index

func _on_Forno_area_entered(area):
	if area.get_parent().get_name() == "player":
		area.get_parent().target = self

func _on_Forno_area_exited(area):
	pass
