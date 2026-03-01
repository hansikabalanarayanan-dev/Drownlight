extends Node2D

@export var base_speed: float = 120
@export var acceleration_rate: float = 5

var time_alive: float = 0.0
var speed: float

@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	speed = base_speed

func _process(delta):
	if not player:
		return
	
	# Track survival time
	time_alive += delta
	
	# Win after 30 seconds
	if time_alive >= 30:
		print("YOU SURVIVED!")
		get_tree().paused = true
		return
	
	# Increase speed over time
	speed = base_speed + time_alive * acceleration_rate
	
	# Chase player
	var direction = (player.global_position - global_position).normalized()
	global_position += direction * speed * delta
	
	# Simple collision check (no signals needed)
	if global_position.distance_to(player.global_position) < 40:
		print("GAME OVER")
		get_tree().change_scene_to_file("res://deeptrench.tscn")
