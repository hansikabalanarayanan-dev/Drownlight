extends CharacterBody2D

@export var speed = 130
@export var move_distance = 150
var start_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	global_position.x += speed * direction * delta
	if abs(global_position.x - start_position.x) > move_distance:
		direction *= -1

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.die()
