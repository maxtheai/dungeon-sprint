extends Node2D
class_name Room

# Room configuration
@export var room_width: int = 20
@export var room_height: int = 15
@export var tile_size: int = 32

# Tilemap layers
@onready var floor_tilemap: TileMap = $FloorTileMap
@onready var wall_tilemap: TileMap = $WallTileMap
@onready var enemy_spawn_points: Node2D = $EnemySpawnPoints
@onready var player_spawn: Marker2D = $PlayerSpawn

# Enemy scenes
const SLIME_SCENE = preload("res://scenes/enemies/slime.tscn")
const SKELETON_SCENE = preload("res://scenes/enemies/skeleton.tscn")
const BOSS_SCENE = preload("res://scenes/enemies/boss.tscn")

func _ready():
	_generate_room()
	_spawn_enemies()
	_spawn_player()
	
	GameManager.current_room = self

func _generate_room():
	# Clear existing
	floor_tilemap.clear()
	wall_tilemap.clear()
	
	# Generate floor (simple rectangle room for MVP)
	for x in range(room_width):
		for y in range(room_height):
			floor_tilemap.set_cell(0, Vector2i(x, y), 0)  # Floor tile
	
	# Generate walls (border)
	for x in range(-1, room_width + 1):
		wall_tilemap.set_cell(0, Vector2i(x, -1), 0)  # Top wall
		wall_tilemap.set_cell(0, Vector2i(x, room_height), 0)  # Bottom wall
	
	for y in range(-1, room_height + 1):
		wall_tilemap.set_cell(0, Vector2i(-1, y), 0)  # Left wall
		wall_tilemap.set_cell(0, Vector2i(room_width, y), 0)  # Right wall
	
	# Add some obstacles/pillars (random)
	var num_obstacles = randi() % 5 + 2  # 2-6 obstacles
	for i in range(num_obstacles):
		var ox = randi() % (room_width - 4) + 2
		var oy = randi() % (room_height - 4) + 2
		wall_tilemap.set_cell(0, Vector2i(ox, oy), 0)

func _spawn_enemies():
	var enemy_count = GameManager.get_enemy_count_for_room()
	var is_boss_room = GameManager.rooms_cleared > 0 and GameManager.rooms_cleared % 3 == 0
	
	if is_boss_room:
		_spawn_boss()
	else:
		_spawn_regular_enemies(enemy_count)

func _spawn_regular_enemies(count: int):
	for i in range(count):
		var spawn_pos = _get_random_spawn_position()
		var enemy = _create_random_enemy()
		enemy.global_position = spawn_pos
		add_child(enemy)
		GameManager.register_enemy(enemy)

func _spawn_boss():
	var spawn_pos = Vector2(room_width * tile_size / 2, room_height * tile_size / 2)
	var boss = BOSS_SCENE.instantiate()
	boss.global_position = spawn_pos
	add_child(boss)
	GameManager.register_enemy(boss)

func _create_random_enemy() -> Enemy:
	var roll = randf()
	var difficulty = GameManager.get_difficulty_multiplier()
	
	if roll < 0.6:  # 60% slimes
		var slime = SLIME_SCENE.instantiate()
		slime.max_health = int(40 * difficulty)
		slime.damage = int(8 * difficulty)
		return slime
	else:  # 40% skeletons
		var skeleton = SKELETON_SCENE.instantiate()
		skeleton.max_health = int(60 * difficulty)
		skeleton.damage = int(15 * difficulty)
		skeleton.speed = 60  # Slower but stronger
		return skeleton

func _get_random_spawn_position() -> Vector2:
	# Spawn away from player spawn (center)
	var margin = 3  # Tiles away from center
	var min_x = margin
	var max_x = room_width - margin
	var min_y = margin
	var max_y = room_height - margin
	
	var tile_x = randi() % (max_x - min_x) + min_x
	var tile_y = randi() % (max_y - min_y) + min_y
	
	return Vector2(tile_x * tile_size, tile_y * tile_size)

func _spawn_player():
	if GameManager.player == null:
		# Spawn new player
		var player_scene = preload("res://scenes/player.tscn")
		var player = player_scene.instantiate()
		player.global_position = player_spawn.global_position
		add_child(player)
	else:
		# Move existing player to spawn
		GameManager.player.global_position = player_spawn.global_position

func get_room_center() -> Vector2:
	return Vector2(room_width * tile_size / 2, room_height * tile_size / 2)