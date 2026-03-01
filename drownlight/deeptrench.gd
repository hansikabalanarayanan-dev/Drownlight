extends Node2D

func _ready():
	$SurvivalTimer.start()

func _on_SurvivalTimer_timeout():
	# Player survived 20 seconds — check if still alive
	var player = get_tree().get_first_node_in_group("player")
	if player and not player.dead:
		get_tree().change_scene_to_file("res://victory_scene.tscn")

func _on_death_detector_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_survival_timer_timeout() -> void:
	pass # Replace with function body.


func _on_attack_timer_timeout() -> void:
	pass # Replace with function body.
