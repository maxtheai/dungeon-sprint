extends CharacterBody2D
class_name Enemy

# Stats
@export var max_health: int = 50
@export var speed: float = 80.0
@export var damage: int = 10
@export var attack_range: float = 50.0
@export var detection_range: float = 300.0
@export var xp_value: int = 10

# State
var health: int
var player: Player = null
var can_attack: bool = true
var attack_cooldown: float = 1.0

# AI Behavior
enum State { IDLE, CHASE, ATTACK, DEAD }
var current_state: State = State.IDLE

# Nodes
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var detection_zone: Area2D = $DetectionZone
@onready var attack_zone: Area2D = $AttackZone

func _ready():
	health = max_health
	player = GameManager.player
	
	# Connect detection zones
	detection_zone.body_entered.connect(_on_player_detected)
	detection_zone.body_exited.connect(_on_player_lost)
	attack_zone.body_entered.connect(_on_attack_zone_entered)
	attack_zone.body_exited.connect(_on_attack_zone_exited)

func _physics_process(delta):
	if current_state == State.DEAD:
		return
	
	if player == null:
		return
	
	_match_state()
	move_and_slide()

func _match_state():
	match current_state:
		State.IDLE:
			velocity = Vector2.ZERO
			
		State.CHASE:
			_chase_player()
			
		State.ATTACK:
			_attack_player()
			
		State.DEAD:
			velocity = Vector2.ZERO

func _chase_player():
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * speed
	
	# Face player
	if direction.x > 0:
		scale.x = abs(scale.x)
	elif direction.x < 0:
		scale.x = -abs(scale.x)

func _attack_player():
	velocity = Vector2.ZERO
	
	if can_attack:
		can_attack = false
		_perform_attack()
		await get_tree().create_timer(attack_cooldown).timeout
		can_attack = true

func _perform_attack():
	# Animation trigger
	print("Enemy attacks!")
	
	# Deal damage if player in range
	if player and global_position.distance_to(player.global_position) <= attack_range + 20:
		player.take_damage(damage)

func _on_player_detected(body: Node2D):
	if body.is_in_group("player"):
		player = body
		current_state = State.CHASE

func _on_player_lost(body: Node2D):
	if body.is_in_group("player"):
		current_state = State.IDLE

func _on_attack_zone_entered(body: Node2D):
	if body.is_in_group("player"):
		current_state = State.ATTACK

func _on_attack_zone_exited(body: Node2D):
	if body.is_in_group("player"):
		current_state = State.CHASE

func take_damage(amount: int):
	health -= amount
	
	# Visual feedback
	modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	modulate = Color.WHITE
	
	if health <= 0:
		_die()

func _die():
	current_state = State.DEAD
	GameManager.add_xp(xp_value)
	
	# Death animation/sound placeholder
	print("Enemy died!")
	
	# Drop item chance
	if randf() < 0.3:  # 30% drop chance
		_drop_item()
	
	queue_free()

func _drop_item():
	# Spawn health potion or weapon
	print("Item dropped!")
	# TODO: Implement item dropping

# Override in subclasses for different enemy types
func get_enemy_name() -> String:
	return "Enemy"

func get_enemy_type() -> String:
	return "basic"