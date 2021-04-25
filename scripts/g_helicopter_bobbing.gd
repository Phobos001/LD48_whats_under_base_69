extends Node2D

onready var spr_helicopter: Sprite = $Helicopter

export var bob_strength: float = 16.0
export var bob_speed: float = 2.0

var bob_offset: Vector2 = Vector2.ZERO
var time: float = 0.0

func _ready():
	bob_offset = spr_helicopter.position
	pass # Replace with function body.


func _process(delta):
	time += delta
	spr_helicopter.global_position = bob_offset + Vector2(0, sin(time * bob_speed) * bob_strength)
	pass
