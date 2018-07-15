extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
onready var segmentA = preload("res://SegmentA.tscn")
onready var segmentB = preload("res://SegmentB.tscn")

func _ready():
	var tankerA = tankerTemplate.instance()
	var tankerB = tankerTemplate.instance()
	var tile = []
	
	for i in range (0,260):
		tile.append(segmentB)
	
	
	for i in range (0,260):
		var t = tile[i].instance()
		add_child(t)
		t.global_position = Vector2(0, i*-1000)
	
	
	add_child(tankerA)
	add_child(tankerB)
	tankerB.control_key = KEY_B
	tankerA.get_node(tankerA.tanker_camera).current = true
	tankerB.get_node("Label").text = "B"