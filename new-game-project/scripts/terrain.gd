extends Node3D
# Metres, Godot Y-up. Original browser world Y maps to Godot Z.
const GRID = 128
const CELL = 4.0
const CHUNK = 16
var depths = PackedFloat32Array()
var patches: Dictionary = {}
var material = StandardMaterial3D.new()

func _init() -> void:
	depths.resize((GRID + 1) * (GRID + 1))
	material.vertex_color_use_as_albedo = true
	material.roughness = 0.95
	material.cull_mode = BaseMaterial3D.CULL_DISABLED

func base_height(x: float, z: float) -> float:
	var ridge = 13.0 * exp(-pow((x - 278.0 - (z - 256.0) * 0.25) / 19.0, 2)) * exp(-pow((z - 250.0) / 115.0, 2))
	var valley = -6.0 * exp(-pow((x - 218.0) / 35.0, 2) - pow((z - 294.0) / 66.0, 2))
	return ridge + valley + 1.5 * sin(x / 51.0) * cos(z / 63.0)

func vertex_height(x: int, z: int) -> float:
	return base_height(x * CELL, z * CELL) - depths[z * (GRID + 1) + x]

func height_at(x: float, z: float) -> float:
	var gx = clampf(x / CELL, 0.0, GRID - 0.001)
	var gz = clampf(z / CELL, 0.0, GRID - 0.001)
	var ix = int(gx)
	var iz = int(gz)
	return lerpf(lerpf(vertex_height(ix, iz), vertex_height(ix + 1, iz), gx - ix),
		lerpf(vertex_height(ix, iz + 1), vertex_height(ix + 1, iz + 1), gx - ix), gz - iz)

func build() -> void:
	for z in range(0, GRID, CHUNK):
		for x in range(0, GRID, CHUNK):
			var patch = MeshInstance3D.new()
			patch.material_override = material
			add_child(patch)
			patches[Vector2i(x, z)] = patch
			rebuild(Vector2i(x, z))

func rebuild(key: Vector2i) -> void:
	var surface = SurfaceTool.new()
	surface.begin(Mesh.PRIMITIVE_TRIANGLES)
	surface.set_smooth_group(0)
	for z in range(key.y, key.y + CHUNK):
		for x in range(key.x, key.x + CHUNK):
			for corner in [Vector2i(x,z), Vector2i(x+1,z), Vector2i(x+1,z+1),
				Vector2i(x,z), Vector2i(x+1,z+1), Vector2i(x,z+1)]:
				var h = vertex_height(corner.x, corner.y)
				var dug = depths[corner.y * (GRID + 1) + corner.x] > 0.01
				surface.set_color(Color("#665044") if dug else Color("#52694f").lightened(clampf(h * 0.006, -0.12, 0.12)))
				surface.add_vertex(Vector3(corner.x * CELL, h, corner.y * CELL))
	surface.index()
	surface.generate_normals()
	patches[key].mesh = surface.commit()

func excavate(center: Vector3, radius: float = 10.0) -> int:
	var touched: Dictionary = {}
	var changed = 0
	for z in range(maxi(0, int((center.z - radius) / CELL)), mini(GRID, int((center.z + radius) / CELL) + 1) + 1):
		for x in range(maxi(0, int((center.x - radius) / CELL)), mini(GRID, int((center.x + radius) / CELL) + 1) + 1):
			var distance = Vector2(x * CELL - center.x, z * CELL - center.z).length()
			if distance >= radius:
				continue
			var index = z * (GRID + 1) + x
			var next = minf(12.0, depths[index] + 4.0 * (1.0 - distance / radius))
			if next <= depths[index]:
				continue
			depths[index] = next
			changed += 1
			for cz in [maxi(0, z - 1) / CHUNK, mini(GRID - 1, z) / CHUNK]:
				for cx in [maxi(0, x - 1) / CHUNK, mini(GRID - 1, x) / CHUNK]:
					touched[Vector2i(int(cx) * CHUNK, int(cz) * CHUNK)] = true
	for key in touched:
		if patches.has(key):
			rebuild(key)
	return changed
