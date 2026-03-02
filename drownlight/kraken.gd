extends Node2D

@export var tentacle_scene: PackedScene
@onready var player = get_tree().get_first_node_in_group("player")
@onready var container = $"../Tentacles"

func _ready():
	print("Kraken ready")
	$AttackTimer.start()

func _on_AttackTimer_timeout():
	print("Spawning tentacle")
	spawn_tentacle()

func spawn_tentacle():
	if not player:
		return

	var t = tentacle_scene.instantiate()
	t.global_position = global_position
	t.direction = (player.global_position - global_position).normalized()
	container.add_child(t)
