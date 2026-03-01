extends Area2D

@export var speed = 300
var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed * delta

	# delete if off screen
	if position.y < -200 or position.y > 2000:
		queue_free()
