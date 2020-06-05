extends KinematicBody

const GRAV = 800
const MOVE_SPEED = 800

var vel = Vector3()

var is_in_range = false

var target

var player_name

onready var area = $Range
onready var mesh = $MeshInstance
onready var dialog_screen = $Dialog
onready var exclamation = $exclamation

var mat
var texture

func _ready():
	
	player_name = "Bakurobuku"
	
	mat = mesh.get_surface_material(0)
	texture = mat.get_texture(mat.TEXTURE_ALBEDO)
	
	dialog_screen.set_player_name(player_name)

func _physics_process(delta):

	var dir = Vector3()

	if Input.is_action_pressed("ui_down"):
		dir.z += 1

	if Input.is_action_pressed("ui_up"):
		dir.z -= 1

	if Input.is_action_pressed("ui_right"):
		dir.x += 1

	if Input.is_action_pressed("ui_left"):
		dir.x -= 1

	dir = dir.normalized()

	vel = dir * MOVE_SPEED * delta
	if !is_on_floor():
		vel.y -= GRAV * delta

	if dialog_screen.visible == false:
		move_and_slide(vel,Vector3.UP,true)
		
	if dir.x != 0 || dir.z != 0:
		texture.set_fps(10)
	else:
		texture.set_fps(0)

func _process(delta):

	if target != null && dialog_screen.visible == false:
		exclamation.show()
		if Input.is_action_just_pressed("ui_select"):
			interact()
	else:
		exclamation.hide()

	if area.get_overlapping_areas() == []:
		target = null
		dialog_screen.end_dialogue()

func interact():

	if target.is_in_group("Talk") && dialog_screen.visible == false:
		dialog_screen.start_dialogue(target)
		dialog_screen.show()

#---------------------------------------------#

	if target.is_in_group("Door"):
		translation = target.get_destination()
