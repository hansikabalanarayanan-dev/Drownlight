extends CharacterBody2D

@export var speed = 200
@export var oxygen = 100.0
var start_position
var dead = false
var invincible = true

func _ready():
	start_position = global_position
	add_to_group("player")
	await get_tree().create_timer(2.0).timeout
	invincible = false

func _physics_process(delta):
	if dead:
		return
	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = dir.normalized() * speed
	move_and_slide()
	if global_position.x >= get_viewport_rect().size.x:
		get_tree().change_scene_to_file("res://shipwreck.tscn")

func _process(delta):
	if dead:
		return
	oxygen -= delta * 5
	if oxygen <= 0:
		die()

func die():
	if dead or invincible:
		return
	dead = true
	get_tree().reload_current_scene()


func _on_death_detector_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
