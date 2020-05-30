extends Area

onready var destiny = $Destiny

func _ready():
	pass

func get_destination():
	return destiny.get_global_transform().origin


func _on_Door_area_entered(area):
	if area.get_parent().get_name() == "player":
		area.get_parent().target = self


func _on_Door_area_exited(area):
	pass
