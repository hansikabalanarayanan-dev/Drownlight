extends CanvasLayer

@onready var player = get_parent().get_node("player")
@onready var oxygen_bar = $oxygenbar

func _ready():
	oxygen_bar.max_value = 100
	oxygen_bar.value = 100

func _process(delta):
	if player:
		oxygen_bar.value = player.oxygen
