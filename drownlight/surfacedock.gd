extends Node2D

@onready var player = $Player
var diving = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and not diving:
		diving = true
		player.start_dive()
		await get_tree().create_timer(1.2).timeout
		get_tree().change_scene_to_file("res://reef.tscn")
