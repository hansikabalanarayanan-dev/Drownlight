extends CanvasLayer

@onready var health_bar = $oxygenbar

func _ready():
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.health_changed.connect(_on_health_changed)
		health_bar.max_value = player.max_health
		health_bar.value = player.health

func _on_health_changed(new_health, max_health):
	health_bar.max_value = max_health
	health_bar.value = new_health
