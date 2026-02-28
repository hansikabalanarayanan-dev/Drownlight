extends CharacterBody2D

@export var speed = 150
@export var move_distance = 300

var start_position
var direction = 1

func _ready():
	start_position = global_position

func _physics_process(delta):
	velocity.x = speed * direction
	move_and_slide()

	if abs(global_position.x - start_position.x) > move_distance:
		direction *= -1
