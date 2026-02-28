extends CanvasLayer

@onready var player = get_parent().get_node("player")
@onready var oxygen_bar = $oxygenbar

func _process(delta):
	if player:
		oxygen_bar.value = player.oxygen
