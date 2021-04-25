extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var running_game: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func next_section():
	running_game.start_dive()
