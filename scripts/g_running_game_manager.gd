extends Node

onready var scn_intro_packed = preload("res://Sections/0_Intro.tscn")
onready var scn_dive_packed = preload("res://Sections/1-4_DiveIntoOcean.tscn")
onready var scn_deeper_packed = preload("res://Sections/4-8_DeeperAndDeeper.tscn")
onready var scn_ohno_packed = preload("res://Sections/8-14_OHNO.tscn")
onready var scn_final_packed = preload("res://Sections/14-18_FinalBattle.tscn")
onready var scn_lastthing_packed = preload("res://Sections/19_OneLastThing.tscn")
onready var scn_score_packed = preload("res://Sections/20_ScoreScreen.tscn")

var scn_intro: 		Node
var scn_dive: 		Node
var scn_deeper: 	Node
var scn_ohno: 		Node
var scn_final: 		Node
var scn_lastthing: 	Node
var scn_score: 		Node

var hit_birds: 	int = 0
var hit_mines: 	int = 0
var hit_fish: 	int = 0
var hit_drones: int = 0
var hit_steam: 	int = 0
var hit_missle: int = 0
var hit_slime: 	int = 0

var collect_coins: int = 0
var dance_framechanges: int = 0
var diving_power: int = 0

var goal_dancefrenzy: 		bool = false
var goal_groundup_1: 		bool = false
var goal_cannonball: 		bool = false
var goal_hit_all_birds: 	bool = false
var goal_sink_nohits: 		bool = false
var goal_rise_nohits: 		bool = false
var goal_groundup_2: 		bool = false
var goal_perfect_grapple: 	bool = false
var goal_fly1_nohits: 		bool = false
var goal_fly2_nohits: 		bool = false
var goal_safely_unload: 	bool = false


func _ready():
	start_intro()
	pass

func kill_all_active_sections():
	if (scn_intro != null):
		scn_intro.queue_free()
	if (scn_dive != null):
		scn_dive.queue_free()
	if (scn_deeper != null):
		scn_deeper.queue_free()
	if(scn_ohno != null):
		scn_ohno.queue_free()
	if(scn_final != null):
		scn_final.queue_free()
	if (scn_lastthing != null):
		scn_lastthing.queue_free()
	if (scn_score != null):
		scn_score.queue_free()

func start_intro():
	kill_all_active_sections()
	scn_intro = scn_intro_packed.instance()
	add_child(scn_intro)
	scn_intro.running_game = self
	
func start_dive():
	kill_all_active_sections()
	scn_dive = scn_dive_packed.instance()
	add_child(scn_dive)
	scn_dive.running_game = self
	
func start_deeper():
	kill_all_active_sections()
	scn_deeper = scn_deeper_packed.instance()
	add_child(scn_deeper)

func start_ohno():
	kill_all_active_sections()
	scn_ohno = scn_ohno_packed.instance()
	add_child(scn_ohno)
	
func start_final():
	kill_all_active_sections()
	scn_final = scn_final_packed.instance()
	add_child(scn_final)
	
func start_lastthing():
	kill_all_active_sections()
	scn_lastthing = scn_lastthing_packed.instance()
	add_child(scn_lastthing)
	
func start_score():
	kill_all_active_sections()
	scn_score = scn_score_packed.instance()
	add_child(scn_score)
