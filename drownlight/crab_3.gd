extends CharacterBody2D

@export var speed = 140
@export var move_distance = 160

var start_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	velocity.y = speed * direction
	move_and_slide()

	if abs(global_position.y - start_position.y) > move_distance:
		direction *= -1
