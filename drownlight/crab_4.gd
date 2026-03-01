extends CharacterBody2D

@export var speed = 130
@export var move_distance = 150
var start_position
var direction = 1
var player = null

func _ready():
	start_position = global_position
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	global_position.x += speed * direction * delta
	if abs(global_position.x - start_position.x) > move_distance:
		direction *= -1
	if player and not player.dead:
		var dist = global_position.distance_to(player.global_position)
		if dist < 60:
			player.die()
