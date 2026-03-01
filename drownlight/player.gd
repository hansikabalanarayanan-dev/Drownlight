extends CharacterBody2D

@export var speed = 200
@export var oxygen = 100.0

var dead = false

func _physics_process(delta):
	if dead:
		return

	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	velocity = dir.normalized() * speed
	move_and_slide()

	# 🔥 DIE WHEN TOUCHING FLOOR
	for i in range(get_slide_collision_count()):
		var collider = get_slide_collision(i).get_collider()
		if collider and collider.name == "KillFloor":
			die()

func _process(delta):
	if dead:
		return

	oxygen -= delta * 5
	if oxygen <= 0:
		die()

func die():
	if dead:
		return
	dead = true
	get_tree().reload_current_scene()
