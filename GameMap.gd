extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")

export var controlled = KEY_A

func _ready():
	var tankerA = tankerTemplate.instance()
	var tankerB = tankerTemplate.instance()
	var tankerC = tankerTemplate.instance()
	var tankerD = tankerTemplate.instance()
	var tankerE = tankerTemplate.instance()
	var tankerF = tankerTemplate.instance()
	var tankerG = tankerTemplate.instance()
	
	
	var segments = [
	"res://SegmentA.tscn",
	"res://SegmentB.tscn",
	"res://SegmentC.tscn",
	"res://SegmentD.tscn",
	"res://SegmentE.tscn",
	"res://SegmentF.tscn",
	"res://SegmentG.tscn",
	"res://SegmentH.tscn"]
	
	
	#var t = load(segments[0]).instance()
	#add_child(t)
	#t.global_position = Vector2(0,0)
	
	
	add_child(tankerA)
	add_child(tankerB)
	add_child(tankerC)
	add_child(tankerD)
	add_child(tankerE)
	add_child(tankerF)
	add_child(tankerG)
	
	tankerB.control_key = KEY_B
	tankerC.control_key = KEY_C
	tankerD.control_key = KEY_D
	tankerE.control_key = KEY_E
	tankerF.control_key = KEY_F
	tankerG.control_key = KEY_G
	
	tankerB.get_node("Label").text = "B"
	tankerC.get_node("Label").text = "C"
	tankerD.get_node("Label").text = "D"
	tankerE.get_node("Label").text = "E"
	tankerF.get_node("Label").text = "F"
	tankerG.get_node("Label").text = "G"
	
	