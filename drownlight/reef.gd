extends CharacterBody2D

@export var speed = 200
@export var oxygen = 100
@export var trust = 0

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = direction.normalized() * speed
	move_and_slide()

func _process(delta):
	oxygen -= delta * 3
	
	if oxygen <= 0:
		get_tree().reload_current_scene()
