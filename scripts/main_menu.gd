extends Control

func _ready():
	# Connect button signal (already connected in scene, but double-check)
	$StartButton.pressed.connect(_on_start_button_pressed)

func _on_start_button_pressed():
	print("Starting game...")
	GameManager.start_game()

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_start_button_pressed()