extends Node2D

@onready var player = $Player
var diving = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and not diving:
		diving = true
		start_dive()

func start_dive():
	# Disable normal movement
	player.set_physics_process(false)

	# Make player move downward
	player.velocity = Vector2(0, 400)

	# Wait a short moment
	await get_tree().create_timer(0.8).timeout

	# Change scene
	get_tree().change_scene_to_file("res://reef.tscn")
