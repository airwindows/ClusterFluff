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
	"res://SegmentA.tscn",
	"res://SegmentB.tscn",
	"res://SegmentC.tscn",
	"res://SegmentD.tscn",
	"res://SegmentE.tscn",
	"res://SegmentF.tscn",
	"res://SegmentG.tscn",
	"res://SegmentH.tscn",
	"res://SegmentI.tscn",
	"res://SegmentJ.tscn",
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
	"res://SegmentZ.tscn"]
	
	var t = load(segments[$"../Globals".level]).instance()
	#GameMap is our root so we don't have to go down two levels to get to globals, which are
	#Project/ProjectSettings/Autoloaded at the same level as this very script. Everywhere else we gotta
	#go down two levels like this: $"../../Globals".score
	add_child(t)
	t.global_position = Vector2(-960,-540)
	#this way we can build the levels while using the reference lines for positioning
	
	add_child(tankerA)
	tankerA.global_position = Vector2(-600,500)
	
	if $"../Globals".level > 0:
		add_child(tankerB)
		tankerB.control_key = KEY_B
		tankerB.get_node("Label").text = "B"
		tankerB.global_position = Vector2(-550,500)
	
	if $"../Globals".level > 1:
		add_child(tankerC)
		tankerC.control_key = KEY_C
		tankerC.get_node("Label").text = "C"
		tankerC.global_position = Vector2(-500,500)
	
	if $"../Globals".level > 2:
		add_child(tankerD)
		tankerD.control_key = KEY_D
		tankerD.get_node("Label").text = "D"
		tankerD.global_position = Vector2(-450,500)
	
	if $"../Globals".level > 3:
		add_child(tankerE)
		tankerE.control_key = KEY_E
		tankerE.get_node("Label").text = "E"
		tankerE.global_position = Vector2(-400,500)
	
	if $"../Globals".level > 4:
		add_child(tankerF)
		tankerF.control_key = KEY_F
		tankerF.get_node("Label").text = "F"
		tankerF.global_position = Vector2(-350,500)
	
	if $"../Globals".level > 5:
		add_child(tankerG)
		tankerG.control_key = KEY_G
		tankerG.get_node("Label").text = "G"
		tankerG.global_position = Vector2(-300,500)
	
	if $"../Globals".level > 6:
		add_child(tankerH)
		tankerH.control_key = KEY_H
		tankerH.get_node("Label").text = "H"
		tankerH.global_position = Vector2(-250,500)
	
	if $"../Globals".level > 7:
		add_child(tankerI)
		tankerI.control_key = KEY_I
		tankerI.get_node("Label").text = "I"
		tankerI.global_position = Vector2(-200,500)
	
	if $"../Globals".level > 8:
		add_child(tankerJ)
		tankerJ.control_key = KEY_J
		tankerJ.get_node("Label").text = "J"
		tankerJ.global_position = Vector2(-150,500)
	
	if $"../Globals".level > 9:
		add_child(tankerK)
		tankerK.control_key = KEY_K
		tankerK.get_node("Label").text = "K"
		tankerK.global_position = Vector2(-100,500)
	
	if $"../Globals".level > 10:
		add_child(tankerL)
		tankerL.control_key = KEY_L
		tankerL.get_node("Label").text = "L"
		tankerL.global_position = Vector2(-50,500)
	
	if $"../Globals".level > 11:
		add_child(tankerM)
		tankerM.control_key = KEY_M
		tankerM.get_node("Label").text = "M"
		tankerM.global_position = Vector2(0,500)
	
	if $"../Globals".level > 12:
		add_child(tankerN)
		tankerN.control_key = KEY_N
		tankerN.get_node("Label").text = "N"
		tankerN.global_position = Vector2(50,500)
	
	if $"../Globals".level > 13:
		add_child(tankerO)
		tankerO.control_key = KEY_O
		tankerO.get_node("Label").text = "O"
		tankerO.global_position = Vector2(100,500)
	
	if $"../Globals".level > 14:
		add_child(tankerP)
		tankerP.control_key = KEY_P
		tankerP.get_node("Label").text = "P"
		tankerP.global_position = Vector2(150,500)
	
	if $"../Globals".level > 15:
		add_child(tankerQ)
		tankerQ.control_key = KEY_Q
		tankerQ.get_node("Label").text = "Q"
		tankerQ.global_position = Vector2(200,500)
	
	if $"../Globals".level > 16:
		add_child(tankerR)
		tankerR.control_key = KEY_R
		tankerR.get_node("Label").text = "R"
		tankerR.global_position = Vector2(250,500)
	
	if $"../Globals".level > 17:
		add_child(tankerS)
		tankerS.control_key = KEY_S
		tankerS.get_node("Label").text = "S"
		tankerS.global_position = Vector2(300,500)
	
	if $"../Globals".level > 18:
		add_child(tankerT)
		tankerT.control_key = KEY_T
		tankerT.get_node("Label").text = "T"
		tankerT.global_position = Vector2(350,500)
	
	if $"../Globals".level > 19:
		add_child(tankerU)
		tankerU.control_key = KEY_U
		tankerU.get_node("Label").text = "U"
		tankerU.global_position = Vector2(400,500)
	
	if $"../Globals".level > 20:
		add_child(tankerV)
		tankerV.control_key = KEY_V
		tankerV.get_node("Label").text = "V"
		tankerV.global_position = Vector2(450,500)
	
	if $"../Globals".level > 21:
		add_child(tankerW)
		tankerW.control_key = KEY_W
		tankerW.get_node("Label").text = "W"
		tankerW.global_position = Vector2(500,500)
	
	if $"../Globals".level > 22:
		add_child(tankerX)
		tankerX.control_key = KEY_X
		tankerX.get_node("Label").text = "X"
		tankerX.global_position = Vector2(550,500)
	
	if $"../Globals".level > 23:
		add_child(tankerY)
		tankerY.control_key = KEY_Y
		tankerY.get_node("Label").text = "Y"
		tankerY.global_position = Vector2(600,500)
	
	if $"../Globals".level > 24:
		add_child(tankerZ)
		tankerZ.control_key = KEY_Z
		tankerZ.get_node("Label").text = "Z"
		tankerZ.global_position = Vector2(650,500)
	
	