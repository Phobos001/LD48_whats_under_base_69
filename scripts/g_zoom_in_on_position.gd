extends Node

export var target_node_path: NodePath

onready var camera: Camera2D = $Camera2D
onready var target_node: Node2D = get_node(target_node_path)

export var target_zoom: float = 2.0
export var target_zoom_speed: float = 10.0
export var target_node_speed: float = 10.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	camera.zoom = camera.zoom.linear_interpolate(Vector2.ONE * target_zoom, target_zoom_speed * delta)
	camera.global_position = camera.global_position.linear_interpolate(target_node.global_position, target_zoom_speed * delta)
	pass
