extends Node2D

@onready var player = $Player
@onready var oxygen_bar = $CanvasLayer/OxygenBar

func _process(delta):
	oxygen_bar.value = player.oxygen


# Called when the node enters the scene tree for the first time.
