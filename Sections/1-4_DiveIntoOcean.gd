extends Node

export var spr_player_dance_idle: 	Texture = preload("res://sprites/1-4/1-4_char_dancing1.png")
export var spr_player_dance_left: 	Texture = preload("res://sprites/1-4/1-4_char_dancing2.png")
export var spr_player_dance_right: 	Texture = preload("res://sprites/1-4/1-4_char_dancing3.png")
export var spr_player_dance_up: 	Texture = preload("res://sprites/1-4/1-4_char_dancing4.png")
export var spr_player_dance_down: 	Texture = preload("res://sprites/1-4/1-4_char_dancing5.png")

export var spr_player_helmet_idle: 			Texture = preload("res://sprites/1-4/char_idle_helmet.png")
export var spr_player_helmet_diving: 		Texture = preload("res://sprites/1-4/char_diving_helmet.png")
export var spr_player_helmet_diving_start: 	Texture = preload("res://sprites/1-4/char_diving_helmet_start.png")
export var spr_player_helmet_diving_fall: 	Texture = preload("res://sprites/1-4/char_diving_helmet_fall.png")

onready var spr_player: Sprite = 			$AnimationPlayer/Objects/Node2D/Helicopter/Player
onready var spr_playershake: Sprite = 		$AnimationPlayer/Objects/Node2D/Helicopter/Player/PlayerShakeSprite
onready var camera: Camera2D = 				$AnimationPlayer/Objects/Node/Camera2D
onready var spr_movetutorial_text: Sprite = $AnimationPlayer/Objects/Node/Camera2D/TutMove
onready var spr_usetutorial_text: Sprite = 	$AnimationPlayer/Objects/Node/Camera2D/TutUse

var runtime: float = 0.0

var last_player_frame_while_dancing: Texture

var last_player_position_before_diving: Vector2
var diving_power: int = 0
var dance_framechanges: int = 0

var running_game

func _ready():
	randomize()
	spr_movetutorial_text.modulate.a = 0
	spr_usetutorial_text.modulate.a = 0
	spr_playershake.texture = null
	pass
	
func _process(delta):
	runtime += delta
	
	if runtime < 14:
		update_dance_input(delta)
	elif runtime > 14: 
		update_diving(delta)
	update_tutorial_move(delta)
	
	spr_movetutorial_text.scale = camera.zoom
	spr_usetutorial_text.scale = camera.zoom
	
func fadein_tutorial_move(delta):
	spr_movetutorial_text.modulate.a = lerp(spr_movetutorial_text.modulate.a, 1, delta)
	
func fadeout_tutorial_move(delta):
	spr_movetutorial_text.modulate.a = lerp(spr_movetutorial_text.modulate.a, 0, 2 * delta)

func update_tutorial_move(delta):
	if (runtime > 1 and runtime < 12):
		fadein_tutorial_move(delta)
	else:
		fadeout_tutorial_move(delta)

func update_dance_input(delta):
	
	if (runtime < 14):
		if (Input.is_action_just_pressed("move_left")):
			if (spr_player.texture != spr_player_dance_left):
				dance_framechanges += 1
			spr_player.texture = spr_player_dance_left
			last_player_frame_while_dancing = spr_player_dance_left
		if (Input.is_action_just_pressed("move_right")):
			if (spr_player.texture != spr_player_dance_right):
				dance_framechanges += 1
			spr_player.texture = spr_player_dance_right
			last_player_frame_while_dancing = spr_player_dance_right
		if (Input.is_action_just_pressed("move_up")):
			if (spr_player.texture != spr_player_dance_up):
				dance_framechanges += 1
			spr_player.texture = spr_player_dance_up
			last_player_frame_while_dancing = spr_player_dance_up
		if (Input.is_action_just_pressed("move_down")):
			if (spr_player.texture != spr_player_dance_down):
				dance_framechanges += 1
			spr_player.texture = spr_player_dance_down
			last_player_frame_while_dancing = spr_player_dance_down

func update_diving(delta):
	if (runtime < 17):
		spr_player.texture = spr_player_helmet_idle
	if (runtime >= 17 and runtime < 22):
		spr_usetutorial_text.modulate.a = lerp(spr_usetutorial_text.modulate.a, 1, 10 * delta)
		spr_usetutorial_text.position = Vector2(rand_range(-1, 1), rand_range(-1, 1))
		spr_player.texture = null
		spr_playershake.texture = spr_player_helmet_diving
		if (Input.is_action_just_pressed("action_use")):
			diving_power += 1
		spr_playershake.position = Vector2(rand_range(-diving_power, diving_power), rand_range(-diving_power, diving_power)) * 0.05
	if (runtime >= 22):
		if (running_game != null):
			running_game.diving_power = diving_power
			running_game.dance_framechanges = dance_framechanges
		spr_usetutorial_text.modulate.a = lerp(spr_usetutorial_text.modulate.a, 0, 10 * delta)
		spr_playershake.visible = false
		spr_player.texture = spr_player_helmet_idle
	pass

func next_section():
	running_game.start_deeper()
