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
	var tankerH = tankerTemplate.instance()
	var tankerI = tankerTemplate.instance()
	var tankerJ = tankerTemplate.instance()
	var tankerK = tankerTemplate.instance()
	var tankerL = tankerTemplate.instance()
	var tankerM = tankerTemplate.instance()
	var tankerN = tankerTemplate.instance()
	var tankerO = tankerTemplate.instance()
	var tankerP = tankerTemplate.instance()
	var tankerQ = tankerTemplate.instance()
	var tankerR = tankerTemplate.instance()
	var tankerS = tankerTemplate.instance()
	var tankerT = tankerTemplate.instance()
	var tankerU = tankerTemplate.instance()
	var tankerV = tankerTemplate.instance()
	var tankerW = tankerTemplate.instance()
	var tankerX = tankerTemplate.instance()
	var tankerY = tankerTemplate.instance()
	var tankerZ = tankerTemplate.instance()
	
	
	var segments = [
	"res://SegmentB.tscn", #replace with segment under test, set level % to 1
	"res://SegmentP.tscn",
	"res://SegmentJ.tscn",
	"res://SegmentF.tscn",
	"res://SegmentH.tscn",
	"res://SegmentI.tscn",
	"res://SegmentG.tscn",
	"res://SegmentA.tscn",
	"res://SegmentD.tscn",
	"res://SegmentC.tscn",
	"res://SegmentE.tscn",
	"res://SegmentK.tscn",
	"res://SegmentL.tscn",
	"res://SegmentM.tscn",
	"res://SegmentN.tscn",
	"res://SegmentO.tscn",
	"res://SegmentP.tscn",
	"res://SegmentQ.tscn",
	"res://SegmentR.tscn",
	"res://SegmentS.tscn",
	"res://SegmentT.tscn",
	"res://SegmentU.tscn",
	"res://SegmentV.tscn",
	"res://SegmentW.tscn",
	"res://SegmentX.tscn",
	"res://SegmentY.tscn",
	"res://SegmentZ.tscn",
	"res://SegmentZ.tscn",
	"res://SegmentZ.tscn",
	"res://SegmentZ.tscn"]
	#got a few extra in case the math gives us higher numbers
	
	var t = load(segments[$"../Globals".level % 11]).instance() #26
	#GameMap is our root so we don't have to go down two levels to get to globals, which are
	#Project/ProjectSettings/Autoloaded at the same level as this very script. Everywhere else we gotta
	#go down two levels like this: $"../../Globals".score
	add_child(t)
	t.global_position = Vector2(-960,-540)
	#this way we can build the levels while using the reference lines for positioning
	
	if $"../Globals".pachinkomode:
		$"../Globals".players = 25
		#pachinko mode testing means you always have every player
	
	add_child(tankerA)
	tankerA.global_position = Vector2(-600,500)
	
	if $"../Globals".players > 0:
		add_child(tankerB)
		tankerB.control_key = KEY_B
		tankerB.get_node("DotFlare/Label").text = "B"
		tankerB.global_position = Vector2(-550,500)
	
	if $"../Globals".players > 1:
		add_child(tankerC)
		tankerC.control_key = KEY_C
		tankerC.get_node("DotFlare/Label").text = "C"
		tankerC.global_position = Vector2(-500,500)
	
	if $"../Globals".players > 2:
		add_child(tankerD)
		tankerD.control_key = KEY_D
		tankerD.get_node("DotFlare/Label").text = "D"
		tankerD.global_position = Vector2(-450,500)
	
	if $"../Globals".players > 3:
		add_child(tankerE)
		tankerE.control_key = KEY_E
		tankerE.get_node("DotFlare/Label").text = "E"
		tankerE.global_position = Vector2(-400,500)
	
	if $"../Globals".players > 4:
		add_child(tankerF)
		tankerF.control_key = KEY_F
		tankerF.get_node("DotFlare/Label").text = "F"
		tankerF.global_position = Vector2(-350,500)
	
	if $"../Globals".players > 5:
		add_child(tankerG)
		tankerG.control_key = KEY_G
		tankerG.get_node("DotFlare/Label").text = "G"
		tankerG.global_position = Vector2(-300,500)
	
	if $"../Globals".players > 6:
		add_child(tankerH)
		tankerH.control_key = KEY_H
		tankerH.get_node("DotFlare/Label").text = "H"
		tankerH.global_position = Vector2(-250,500)
	
	if $"../Globals".players > 7:
		add_child(tankerI)
		tankerI.control_key = KEY_I
		tankerI.get_node("DotFlare/Label").text = "I"
		tankerI.global_position = Vector2(-200,500)
	
	if $"../Globals".players > 8:
		add_child(tankerJ)
		tankerJ.control_key = KEY_J
		tankerJ.get_node("DotFlare/Label").text = "J"
		tankerJ.global_position = Vector2(-150,500)
	
	if $"../Globals".players > 9:
		add_child(tankerK)
		tankerK.control_key = KEY_K
		tankerK.get_node("DotFlare/Label").text = "K"
		tankerK.global_position = Vector2(-100,500)
	
	if $"../Globals".players > 10:
		add_child(tankerL)
		tankerL.control_key = KEY_L
		tankerL.get_node("DotFlare/Label").text = "L"
		tankerL.global_position = Vector2(-50,500)
	
	if $"../Globals".players > 11:
		add_child(tankerM)
		tankerM.control_key = KEY_M
		tankerM.get_node("DotFlare/Label").text = "M"
		tankerM.global_position = Vector2(0,500)
	
	if $"../Globals".players > 12:
		add_child(tankerN)
		tankerN.control_key = KEY_N
		tankerN.get_node("DotFlare/Label").text = "N"
		tankerN.global_position = Vector2(50,500)
	
	if $"../Globals".players > 13:
		add_child(tankerO)
		tankerO.control_key = KEY_O
		tankerO.get_node("DotFlare/Label").text = "O"
		tankerO.global_position = Vector2(100,500)
	
	if $"../Globals".players > 14:
		add_child(tankerP)
		tankerP.control_key = KEY_P
		tankerP.get_node("DotFlare/Label").text = "P"
		tankerP.global_position = Vector2(150,500)
	
	if $"../Globals".players > 15:
		add_child(tankerQ)
		tankerQ.control_key = KEY_Q
		tankerQ.get_node("DotFlare/Label").text = "Q"
		tankerQ.global_position = Vector2(200,500)
	
	if $"../Globals".players > 16:
		add_child(tankerR)
		tankerR.control_key = KEY_R
		tankerR.get_node("DotFlare/Label").text = "R"
		tankerR.global_position = Vector2(250,500)
	
	if $"../Globals".players > 17:
		add_child(tankerS)
		tankerS.control_key = KEY_S
		tankerS.get_node("DotFlare/Label").text = "S"
		tankerS.global_position = Vector2(300,500)
	
	if $"../Globals".players > 18:
		add_child(tankerT)
		tankerT.control_key = KEY_T
		tankerT.get_node("DotFlare/Label").text = "T"
		tankerT.global_position = Vector2(350,500)
	
	if $"../Globals".players > 19:
		add_child(tankerU)
		tankerU.control_key = KEY_U
		tankerU.get_node("DotFlare/Label").text = "U"
		tankerU.global_position = Vector2(400,500)
	
	if $"../Globals".players > 20:
		add_child(tankerV)
		tankerV.control_key = KEY_V
		tankerV.get_node("DotFlare/Label").text = "V"
		tankerV.global_position = Vector2(450,500)
	
	if $"../Globals".players > 21:
		add_child(tankerW)
		tankerW.control_key = KEY_W
		tankerW.get_node("DotFlare/Label").text = "W"
		tankerW.global_position = Vector2(500,500)
	
	if $"../Globals".players > 22:
		add_child(tankerX)
		tankerX.control_key = KEY_X
		tankerX.get_node("DotFlare/Label").text = "X"
		tankerX.global_position = Vector2(550,500)
	
	if $"../Globals".players > 23:
		add_child(tankerY)
		tankerY.control_key = KEY_Y
		tankerY.get_node("DotFlare/Label").text = "Y"
		tankerY.global_position = Vector2(600,500)
	
	if $"../Globals".players > 24:
		add_child(tankerZ)
		tankerZ.control_key = KEY_Z
		tankerZ.get_node("DotFlare/Label").text = "Z"
		tankerZ.global_position = Vector2(650,500)
	
	