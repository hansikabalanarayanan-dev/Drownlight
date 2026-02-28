extends CharacterBody2D

@export var speed = 200
@export var jump_force = -600
@export var gravity = 1200
@export var dive_forward_speed = 250

@export var dock_texture: Texture2D
@export var dive_texture: Texture2D

@onready var sprite = $Sprite2D

var diving = false

func _ready():
	sprite.texture = dock_texture

func _physics_process(delta):

	if diving:
		velocity.y += gravity * delta
		velocity.x = dive_forward_speed
		move_and_slide()
		return

	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * speed
	move_and_slide()

func start_dive():
	diving = true
	velocity = Vector2(dive_forward_speed, jump_force)
	sprite.texture = dive_texture
