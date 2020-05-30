extends Area

var dialog_path = "res://Chars/OneGuy/OneGuy.json"

func _ready():
	pass

func get_dialogue_path():
	return dialog_path

func get_portrait():
	var portrait = "res://Chars/OneGuy/oneguyfoshure.png"
	return portrait

func get_initial_index():
	var index = "001"
	
	return index

func _on_OneGuy_area_entered(area):
	if area.get_parent().get_name() == "player":
		area.get_parent().target = self


func _on_OneGuy_area_exited(area):
	pass # Replace with function body.
