extends CharacterBody2D

@export var speed = 200
@export var oxygen = 100.0

func _physics_process(delta):
	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = dir.normalized() * speed
	move_and_slide()

func _process(delta):
	oxygen -= delta * 5
	if oxygen < 0:
		oxygen = 0
func _on_body_entered(body):
	if body.name == "Crab":
		get_tree().reload_current_scene()
