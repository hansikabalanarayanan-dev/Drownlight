
extends Node2D

var total_gold
var collected_gold = 0

func _ready():
	total_gold = get_tree().get_nodes_in_group("gold").size()
	
func gold_collected():
	collected_gold += 1
	
	if collected_gold >= total_gold:
		level_complete()
		
func level_complete():
	rumble_screen()
	await get_tree().create_timer(1.0).timeout
	fade_out()
	
func rumble_screen():
	for i in 20:
		position = Vector2(randf_range(-10,10), randf_range(-10,10))
		await get_tree().create_timer(0.03).timeout
	
	position = Vector2.ZERO

func fade_out():
	var fade = $Fade
	
	for i in range(20):
		fade.modulate.a += 0.05
		await get_tree().create_timer(0.05).timeout
		get_tree().change_scene_to_file("res://deeptrench.tscn")


func _on_treasure_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
