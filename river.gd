extends MeshInstance

var mat

func _ready():
	mat = self.get_surface_material(0)

func _process(delta):

	mat.uv2_offset.x -= 1 * delta
	mat.uv1_offset.x -= 1.3 * delta

	mat.uv2_offset.y += 1.3 * delta
	mat.uv1_offset.y += 1.55 * delta
