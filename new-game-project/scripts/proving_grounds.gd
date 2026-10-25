extends Node3D
const TerrainScript = preload("res://scripts/terrain.gd")
var terrain = TerrainScript.new()
var player = Node3D.new()
var camera = Camera3D.new()
var vitals = Label.new()
var aim_marker = Node3D.new()
var target = Vector3(248, 0, 252)
var cooldown = 0.0
var palm: MeshInstance3D
var palm_target = Vector3.ZERO
var palm_time = 0.0
var scars = 0
var clock = 0.0
var capture_frames = 0

func mesh_node(mesh: Mesh, color: Color, at: Vector3, parent: Node3D = self) -> MeshInstance3D:
	var node = MeshInstance3D.new()
	node.mesh = mesh
	var mat = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.85
	node.material_override = mat
	parent.add_child(node)
	node.position = at
	return node

func box(size: Vector3, color: Color, at: Vector3) -> MeshInstance3D:
	var mesh = BoxMesh.new()
	mesh.size = size
	return mesh_node(mesh, color, at)

func _ready() -> void:
	name = "ProvingGrounds"
	add_child(terrain)
	terrain.build()
	var environment = WorldEnvironment.new()
	var settings = Environment.new()
	settings.background_mode = Environment.BG_COLOR
	settings.background_color = Color("#253234")
	settings.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	settings.ambient_light_color = Color("#b7c5b8")
	settings.ambient_light_energy = 0.65
	settings.tonemap_mode = Environment.TONE_MAPPER_FILMIC
	environment.environment = settings
	add_child(environment)
	var sun = DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-50, -32, 0)
	sun.light_color = Color("#f1dfb8")
	sun.shadow_enabled = true
	add_child(sun)
	add_child(player)
	player.position = Vector3(232, terrain.height_at(232, 256) + 3, 256)
	var robe = CylinderMesh.new()
	robe.top_radius = 0.35
	robe.bottom_radius = 0.8
	robe.height = 1.6
	mesh_node(robe, Color("#819a88"), Vector3(0, 0.4, 0), player)
	var head = SphereMesh.new()
	head.radius = 0.28
	head.height = 0.56
	mesh_node(head, Color("#d8c7a3"), Vector3(0, 1.45, 0), player)
	var rng = RandomNumberGenerator.new()
	rng.seed = 71025
	var trees = MultiMesh.new()
	trees.transform_format = MultiMesh.TRANSFORM_3D
	var canopy = SphereMesh.new()
	canopy.radius = 2.6
	canopy.height = 6
	canopy.radial_segments = 12
	canopy.rings = 6
	trees.mesh = canopy
	trees.instance_count = 650
	for i in range(trees.instance_count):
		var x = rng.randf_range(130, 370)
		var z = rng.randf_range(140, 370)
		if Vector2(x - 248, z - 256).length() < 28:
			x += 45
		trees.set_instance_transform(i, Transform3D(Basis.IDENTITY.scaled(Vector3(rng.randf_range(0.8, 1.3), 1, 1)), Vector3(x, terrain.height_at(x, z) + 4, z)))
	var forest = MultiMeshInstance3D.new()
	forest.multimesh = trees
	var foliage = StandardMaterial3D.new()
	foliage.albedo_color = Color("#577755")
	forest.material_override = foliage
	add_child(forest)
	for p in [Vector2(208, 216), Vector2(272, 208), Vector2(312, 272), Vector2(204, 292)]:
		var y = terrain.height_at(p.x, p.y)
		box(Vector3(18, 5, 12), Color("#777f7a"), Vector3(p.x, y + 2.5, p.y))
		box(Vector3(22, 1.2, 15), Color("#465f58"), Vector3(p.x, y + 5.6, p.y))
		box(Vector3(3, 3, 0.3), Color("#253234"), Vector3(p.x, y + 1.5, p.y + 6.1))
	add_child(camera)
	camera.projection = Camera3D.PROJECTION_ORTHOGONAL
	camera.size = 95
	camera.far = 900
	camera.current = true
	add_child(aim_marker)
	var ring = TorusMesh.new()
	ring.inner_radius = 1.7
	ring.outer_radius = 2
	mesh_node(ring, Color("#e9b56d"), Vector3.ZERO, aim_marker)
	setup_hud()
	update_camera(1.0)

func setup_hud() -> void:
	var layer = CanvasLayer.new()
	add_child(layer)
	var panel = PanelContainer.new()
	panel.position = Vector2(22, 22)
	layer.add_child(panel)
	var margin = MarginContainer.new()
	for side in ["left", "top", "right", "bottom"]:
		margin.add_theme_constant_override("margin_" + side, 16)
	panel.add_child(margin)
	var column = VBoxContainer.new()
	column.add_theme_constant_override("separation", 8)
	margin.add_child(column)
	var title = Label.new()
	title.text = "SEVERED HEAVEN  /  NATIVE STUDY"
	title.add_theme_font_size_override("font_size", 22)
	column.add_child(title)
	var controls = Label.new()
	controls.text = "WASD  Fly    F / G  Rise / descend    Shift  Fast flight\nMouse  Aim    E / Left click  Falling Heaven    Wheel  Zoom\nEsc  Quit    F11  Fullscreen"
	column.add_child(controls)
	column.add_child(vitals)
	var note = Label.new()
	note.text = "ENGINE COMPARISON · placeholder geometry · solo only"
	note.modulate = Color("#d8c7a3")
	column.add_child(note)

func update_camera(blend: float) -> void:
	var focus = Vector3(player.position.x, player.position.y * 0.6, player.position.z)
	camera.position = camera.position.lerp(focus + Vector3(48, 65, 48), blend)
	camera.look_at(focus)

func aim_ground() -> Vector3:
	var pointer = get_viewport().get_mouse_position()
	var origin = camera.project_ray_origin(pointer)
	var direction = camera.project_ray_normal(pointer)
	for i in range(1, 401):
		var p = origin + direction * i * 2.0
		if p.x >= 0 and p.x <= 512 and p.z >= 0 and p.z <= 512 and p.y <= terrain.height_at(p.x, p.z):
			p.y = terrain.height_at(p.x, p.z)
			return p
	return player.position

func _physics_process(delta: float) -> void:
	var direction = Vector2(float(Input.is_physical_key_pressed(KEY_D)) - float(Input.is_physical_key_pressed(KEY_A)),
		float(Input.is_physical_key_pressed(KEY_S)) - float(Input.is_physical_key_pressed(KEY_W))).limit_length()
	var right = camera.global_basis.x
	right.y = 0
	var forward = camera.global_basis.z
	forward.y = 0
	var movement = right.normalized() * direction.x + forward.normalized() * direction.y
	player.position += movement * (45.0 if Input.is_physical_key_pressed(KEY_SHIFT) else 22.0) * delta
	player.position.x = clampf(player.position.x, 4, 508)
	player.position.z = clampf(player.position.z, 4, 508)
	player.position.y += (float(Input.is_physical_key_pressed(KEY_F)) - float(Input.is_physical_key_pressed(KEY_G))) * 16 * delta
	player.position.y = clampf(player.position.y, terrain.height_at(player.position.x, player.position.z) + 0.65, 65)
	cooldown = maxf(0, cooldown - delta)
	if palm:
		palm_time += delta
		palm.position.y = palm_target.y + 32 * (1 - minf(1, palm_time / 0.7))
		if palm_time >= 0.7:
			scars += terrain.excavate(palm_target)
			palm.queue_free()
			palm = null

func _process(delta: float) -> void:
	clock += delta
	update_camera(1 - exp(-delta * 10))
	target = aim_ground()
	aim_marker.position = target + Vector3(0, 0.25, 0)
	vitals.text = "%d FPS  ·  %.1fm above ground  ·  %d terrain vertices changed\nFalling Heaven: %s" % [
		Engine.get_frames_per_second(), player.position.y - terrain.height_at(player.position.x, player.position.z), scars,
		"ready" if cooldown <= 0 else "%.1fs" % cooldown]
	if "--capture" in OS.get_cmdline_user_args():
		capture_frames += 1
		if capture_frames == 240:
			get_viewport().get_texture().get_image().save_png("res://docs/native-study.png")
			get_tree().quit()

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.physical_keycode == KEY_ESCAPE:
			get_tree().quit()
		elif event.physical_keycode == KEY_F11:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN else DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif event.physical_keycode == KEY_E:
			cast()
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			cast()
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP:
			camera.size = clampf(camera.size - 6, 35, 150)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			camera.size = clampf(camera.size + 6, 35, 150)

func cast() -> void:
	if cooldown > 0 or palm or player.position.distance_to(target) > 100:
		return
	cooldown = 2.5
	palm_target = target
	palm_time = 0
	var shape = CylinderMesh.new()
	shape.top_radius = 8
	shape.bottom_radius = 8
	shape.height = 0.5
	palm = mesh_node(shape, Color("#e9b56d"), target + Vector3(0, 32, 0))
