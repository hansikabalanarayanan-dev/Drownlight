extends Node2D

func _ready():
	add_to_group("shipwreck")

func check_treasure():
	var remaining = get_tree().get_nodes_in_group("treasure")
	if remaining.size() == 0:
		get_tree().change_scene_to_file("res://deeptrench.tscn")
