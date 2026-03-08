extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		get_parent().gold_collected()
		queue_free()
		
func _ready():
	add_to_group("gold")
	body_entered.connect(_on_body_entered)


	
	
