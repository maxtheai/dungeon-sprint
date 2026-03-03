extends CharacterBody2D
class_name Player

# Stats
@export var max_health: int = 100
@export var speed: float = 200.0
@export var attack_damage: int = 25
@export var attack_cooldown: float = 0.5

# State
var health: int
var can_attack: bool = true
var facing_direction: Vector2 = Vector2.DOWN

# Nodes (fetched safely in _ready)
var sprite: AnimatedSprite2D
var attack_hitbox: Area2D
var attack_cooldown_timer: Timer

# Signals
signal health_changed(new_health, max_health)
signal player_died

func _ready():
	health = max_health
	
	# Safely get nodes
	sprite = get_node_or_null("AnimatedSprite2D")
	attack_hitbox = get_node_or_null("AttackHitbox")
	attack_cooldown_timer = get_node_or_null("AttackCooldown")
	
	# Connect signals if nodes exist
	if attack_hitbox:
		attack_hitbox.body_entered.connect(_on_attack_hit)
	else:
		push_warning("AttackHitbox not found on Player")
	
	if attack_cooldown_timer:
		attack_cooldown_timer.timeout.connect(_on_attack_cooldown_reset)
	else:
		push_warning("AttackCooldown timer not found on Player")
	
	# Connect to game manager
	GameManager.player = self

func _physics_process(delta):
	_handle_movement()
	_handle_attack_input()
	_update_animation()
	move_and_slide()

func _handle_movement():
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("move_left", "move_right")
	input_dir.y = Input.get_axis("move_up", "move_down")
	
	input_dir = input_dir.normalized()
	
	if input_dir != Vector2.ZERO:
		facing_direction = input_dir
		velocity = input_dir * speed
	else:
		velocity = Vector2.ZERO

func _handle_attack_input():
	if Input.is_action_just_pressed("attack") and can_attack:
		_perform_attack()
	
	if Input.is_action_just_pressed("special"):
		_perform_special()

func _perform_attack():
	can_attack = false
	
	if attack_cooldown_timer:
		attack_cooldown_timer.start(attack_cooldown)
	
	# Animation trigger (placeholder - will use AI sprite)
	print("Attack!")
	
	# Position hitbox based on facing direction
	if attack_hitbox:
		attack_hitbox.position = facing_direction * 40
		attack_hitbox.monitoring = true
		
		# Disable hitbox after brief moment
		await get_tree().create_timer(0.1).timeout
		attack_hitbox.monitoring = false

func _perform_special():
	# Special attack - area damage
	print("Special attack!")
	# TODO: Implement special ability

func _on_attack_hit(body: Node2D):
	if body.is_in_group("enemies"):
		body.take_damage(attack_damage)

func _on_attack_cooldown_reset():
	can_attack = true

func _update_animation():
	# Placeholder - will connect to AI-generated sprite animations
	if velocity != Vector2.ZERO:
		# sprite.play("walk")
		pass
	else:
		# sprite.play("idle")
		pass

func take_damage(amount: int):
	health -= amount
	health_changed.emit(health, max_health)
	
	# Flash red (placeholder effect)
	modulate = Color.RED
	await get_tree().create_timer(0.1).timeout
	modulate = Color.WHITE
	
	if health <= 0:
		_die()

func heal(amount: int):
	health = min(health + amount, max_health)
	health_changed.emit(health, max_health)

func _die():
	player_died.emit()
	GameManager.game_over()
	queue_free()

func get_facing_direction() -> Vector2:
	return facing_direction