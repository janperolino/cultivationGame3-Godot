extends SceneTree
func _initialize() -> void:
	var terrain = load("res://scripts/terrain.gd").new()
	var before = terrain.height_at(256, 256)
	assert(terrain.excavate(Vector3(256, 0, 256)) > 0)
	assert(terrain.height_at(256, 256) < before - 3.9)
	assert(is_equal_approx(terrain.height_at(400, 400), terrain.base_height(400, 400)))
	for i in range(10):
		terrain.excavate(Vector3(256, 0, 256))
	assert(is_equal_approx(before - terrain.height_at(256, 256), 12))
	assert(is_finite(terrain.height_at(-10, 900)))
	terrain.free()
	print("PASS: crater lowering, terrain bounds, unchanged distant ground and 12m excavation cap")
	quit()
