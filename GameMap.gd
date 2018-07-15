extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
onready var segmentA = preload("res://root.tscn")

func _ready():
	var tileA = segmentA.instance()
	var tileB = segmentA.instance()
	var tankerA = tankerTemplate.instance()
	var tankerB = tankerTemplate.instance()
	
	add_child(tileA)
	add_child(tileB)
	add_child(tankerA)
	add_child(tankerB)
	tankerB.control_key = KEY_B
	tankerA.get_node(tankerA.tanker_camera).current = true
	tankerB.get_node("Label").text = "B"
	tileB.global_position = Vector2(0,-1000)