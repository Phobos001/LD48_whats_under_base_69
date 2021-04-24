extends Node

onready var scn_intro = load("res://Sections/0_Intro")
onready var scn_dive = load("res://Sections/1-4_DiveIntoOcean")
onready var scn_deeper = load("res://Sections/4-8_DeeperAndDeeper")
onready var scn_ohno = load("res://Sections/8-14_OHNO")
onready var scn_final = load("res://Sections/14-18_FinalBattle")
onready var scn_lastthing = load("res://Sections/19_OneLastThing")
onready var scn_score = load("res://Sections/20_ScoreScreen")

var hit_birds: int = 0
var hit_mines: int = 0
var hit_fish: int = 0
var hit_drones: int = 0
var hit_steam: int = 0


func _ready():
	pass
