extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")

func _ready():
	var tankerA = tankerTemplate.instance()
	var tankerB = tankerTemplate.instance()
	var tankerC = tankerTemplate.instance()
	var tankerD = tankerTemplate.instance()
	var tankerE = tankerTemplate.instance()
	var tankerF = tankerTemplate.instance()
	var tankerG = tankerTemplate.instance()
	
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
	preload("res://SegmentZ.tscn"),
	preload("res://StartLine.tscn"),
	preload("res://FinishLine.tscn")]
	
	var k = 0
	tile.append(segments[26]) #StartLine
	#print (26)
	
	for i in range (0,26):
		for j in range (0, i+1):
			var choice = 0
			choice = (k*k)%int(floor(i)+1)
			if (j == 0):
				choice = i
			tile.append(segments[choice])
			#print (choice)
			k += 1
	tile.append(segments[27]) # FinishLine
	#print (27)
	
	for i in range (0,353):
		var t = tile[i].instance()
		add_child(t)
		t.global_position = Vector2(0, i*-1000)
	
	
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
	
	tankerA.get_node(tankerA.tanker_camera).current = true
	tankerB.get_node("Label").text = "B"
	tankerC.get_node("Label").text = "C"
	tankerD.get_node("Label").text = "D"
	tankerE.get_node("Label").text = "E"
	tankerF.get_node("Label").text = "F"
	tankerG.get_node("Label").text = "G"
	
	