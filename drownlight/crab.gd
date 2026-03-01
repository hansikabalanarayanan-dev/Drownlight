extends StaticBody2D

var start_position
var speed
var move_distance
var direction

func _ready():
	start_position = global_position
	speed = randf_range(80, 200)
	move_distance = randf_range(80, 220)
	direction = 1 if randi() % 2 == 0 else -1

func _process(delta):
	global_position.y += speed * direction * delta
	if abs(global_position.y - start_position.y) > move_distance:
		direction *= -1
