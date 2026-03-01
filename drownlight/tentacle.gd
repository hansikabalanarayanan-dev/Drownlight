extends Area2D

var direction = Vector2.ZERO
var speed = 300.0

func _ready():
	add_to_group("tentacle")
	body_entered.connect(_on_body_entered)

func _process(delta):
	position += direction * speed * delta
	# destroy tentacle after 3 seconds off screen
	await get_tree().create_timer(3.0).timeout
	queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(25.0)
		queue_free()
