extends Area2D

@export var trust_amount = 25
var completed = false

func _on_body_entered(body):
	if body.name == "Player" and not completed:
		body.trust += trust_amount
		completed = true
		queue_free()
