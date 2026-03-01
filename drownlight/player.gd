extends CharacterBody2D

@export var speed = 200
@export var oxygen = 100.0
var dead = false

func _ready():
	add_to_group("player")

func _physics_process(delta):
	if dead:
		return
	var dir = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	velocity = dir.normalized() * speed
	move_and_slide()

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

func _on_treasure_1_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_treasure_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_treasure_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
