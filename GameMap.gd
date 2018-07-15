extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")

func _ready():
	var tankerA = tankerTemplate.instance()
	var tankerB = tankerTemplate.instance()
	var tile = []
	var segments = [
	preload("res://SegmentA.tscn"),
	preload("res://SegmentB.tscn"),
	preload("res://SegmentC.tscn"),
	preload("res://SegmentD.tscn"),
	preload("res://SegmentE.tscn"),
	preload("res://SegmentF.tscn"),
	preload("res://SegmentG.tscn"),
	preload("res://SegmentH.tscn"),
	preload("res://SegmentI.tscn"),
	preload("res://SegmentJ.tscn"),
	preload("res://SegmentK.tscn"),
	preload("res://SegmentL.tscn"),
	preload("res://SegmentM.tscn"),
	preload("res://SegmentN.tscn"),
	preload("res://SegmentO.tscn"),
	preload("res://SegmentP.tscn"),
	preload("res://SegmentQ.tscn"),
	preload("res://SegmentR.tscn"),
	preload("res://SegmentS.tscn"),
	preload("res://SegmentT.tscn"),
	preload("res://SegmentU.tscn"),
	preload("res://SegmentV.tscn"),
	preload("res://SegmentW.tscn"),
	preload("res://SegmentX.tscn"),
	preload("res://SegmentY.tscn"),
	preload("res://SegmentZ.tscn")]
	
	for i in range (0,260):
		var choice = 0
		choice = (i*i*i)%int(floor(i/10)+1)
		if i%10 == 0:
			choice = floor(i/10)
		
		
		tile.append(segments[choice])
	
	for i in range (0,260):
		var t = tile[i].instance()
		add_child(t)
		t.global_position = Vector2(0, i*-1000)
	
	
	add_child(tankerA)
	#add_child(tankerB)
	tankerB.control_key = KEY_B
	tankerA.get_node(tankerA.tanker_camera).current = true
	tankerB.get_node("Label").text = "B"