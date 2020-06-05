extends Control
class_name Dialog

onready var player_portrait = $Control/Panel/VBoxContainer/PlayerPortrait
onready var player_name = $Control/Panel/VBoxContainer/PlayerName

onready var npc_portrait = $Control/Panel2/VBoxContainer2/NPCPortrait
onready var npc_name = $Control/Panel2/VBoxContainer2/NPCName

onready var text = $Control/NinePatchRect/TextOrganizer/speech

onready var answers = $Control/NinePatchRect/TextOrganizer/Panel/Answers

var data = {}
var index

func _ready():
	pass

func set_player_name(_player_name):
	player_name.text = _player_name

func set_player_portrait():
	pass

func set_npc_name(_npc_name):
	npc_name.text = _npc_name

func set_npc_portrait():
	npc_portrait.texture = load(data[index]["portrait"])

func set_text():
	text.text = data[index]["speech"]

func set_index(_index):
	index = _index

func set_current_dialogue():
	set_npc_portrait()
	set_text()
	set_buttons()

func start_dialogue(_target):
	data = load_json(_target.get_dialogue_path())
	index = _target.get_initial_index()
	set_npc_name(_target.get_name())
	set_current_dialogue()

func advance_dialogue(answer):
	print(data[index]["answers"][answer])
	print(data[index]["answers"][answer]["lead_to"])
		
	if data[index]["answers"][answer]["lead_to"] != "end":
		set_index(data[index]["answers"][answer]["lead_to"])
		set_current_dialogue()
	else:
		end_dialogue()

func set_buttons():

	var answer_num = data[index]["answers"].size()

	for i in answers.get_child_count():
		answers.get_child(i).hide()

	for i in answer_num:
		var button = answers.get_child(i)
		button.show()
		button.text = data[index]["answers"]["00" + str(i+1)]["text"]

	answers.get_child(0).grab_focus()

func end_dialogue():
	for i in answers.get_child_count():
		answers.get_child(i).hide()
	self.hide()

func load_json(file_path):

	var file = File.new()

	file.open(file_path, file.READ)

	var path_text = file.get_as_text()

	return parse_json(path_text)

func _on_Button1_pressed():
	advance_dialogue("001")

func _on_Button2_pressed():
	advance_dialogue("002")

func _on_Button3_pressed():
	advance_dialogue("003")

func _on_Button4_pressed():
	advance_dialogue("004")

func _on_Button5_pressed():
	advance_dialogue("005")

func _on_Button6_pressed():
	advance_dialogue("006")
