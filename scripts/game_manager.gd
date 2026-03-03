extends Node

# Singleton for game state management

# References
var player: Player = null
var current_room: Room = null

# Game State
var score: int = 0
var current_floor: int = 1
var rooms_cleared: int = 0
var is_game_over: bool = false

# Player Progression
var player_xp: int = 0
var player_level: int = 1
var xp_to_next_level: int = 100

# Enemies in current room
var enemies_in_room: Array[Enemy] = []

# Signals
signal score_changed(new_score)
signal floor_changed(new_floor)
signal room_cleared
signal game_over_signal
signal level_up(new_level)

func _ready():
	# Initialize
	score = 0
	current_floor = 1
	is_game_over = false

func start_game():
	reset_game()
	# Load first room
	get_tree().change_scene_to_file("res://scenes/dungeon.tscn")

func reset_game():
	score = 0
	current_floor = 1
	rooms_cleared = 0
	player_xp = 0
	player_level = 1
	xp_to_next_level = 100
	is_game_over = false
	player = null
	enemies_in_room.clear()
	score_changed.emit(score)
	floor_changed.emit(current_floor)

func game_over():
	if is_game_over:
		return
	is_game_over = true
	game_over_signal.emit()
	
	# Show game over screen
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func next_floor():
	current_floor += 1
	floor_changed.emit(current_floor)
	
	# Increase difficulty
	# TODO: Adjust enemy stats based on floor

func add_score(points: int):
	score += points
	score_changed.emit(score)

func add_xp(amount: int):
	player_xp += amount
	_check_level_up()

func _check_level_up():
	while player_xp >= xp_to_next_level:
		player_xp -= xp_to_next_level
		player_level += 1
		xp_to_next_level = int(xp_to_next_level * 1.5)  # Exponential curve
		level_up.emit(player_level)
		
		# Buff player stats
		if player:
			player.max_health += 20
			player.health = player.max_health
			player.attack_damage += 5

func register_enemy(enemy: Enemy):
	if not enemies_in_room.has(enemy):
		enemies_in_room.append(enemy)

func unregister_enemy(enemy: Enemy):
	if enemies_in_room.has(enemy):
		enemies_in_room.erase(enemy)
	
	# Check if room is cleared
	if enemies_in_room.is_empty():
		_room_cleared()

func _room_cleared():
	rooms_cleared += 1
	room_cleared.emit()
	add_score(100 * current_floor)  # Score based on floor difficulty
	
	print("Room cleared! Score: ", score)
	
	# Spawn exit or next room trigger
	# TODO: Implement room progression

func get_difficulty_multiplier() -> float:
	return 1.0 + (current_floor * 0.2)  # 20% harder per floor

func get_enemy_count_for_room() -> int:
	# Increase enemy count per floor
	return 2 + min(current_floor, 5)  # 2-7 enemies per room