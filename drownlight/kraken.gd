extends Node2D

@export var tentacle_scene: PackedScene
@onready var player = get_tree().get_first_node_in_group("player")
@onready var tentacle_container = $"../tentacles"

func _ready():
	$AttackTimer.wait_time = 0.6  # attacks every 0.6s — aggressive!
	$AttackTimer.start()

func _on_AttackTimer_timeout():
	spawn_tentacle()

func spawn_tentacle():
	if not player or not tentacle_scene:
		return
	var tentacle = tentacle_scene.instantiate()
	tentacle.global_position = global_position
	var dir = (player.global_position - global_position).normalized()
	tentacle.direction = dir
	tentacle_container.add_child(tentacle)
