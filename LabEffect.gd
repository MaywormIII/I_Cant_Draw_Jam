extends MeshInstance

var mat

func _ready():
	mat = self.get_surface_material(0)

func _process(delta):

	mat.uv2_offset.x -= 0.1 * delta
	mat.uv2_offset.z -= 0.1 * delta
	mat.uv1_offset.y -= 0.2 * delta
