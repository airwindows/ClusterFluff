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
	add_child(tankerH)
	add_child(tankerI)
	add_child(tankerJ)
	add_child(tankerK)
	add_child(tankerL)
	add_child(tankerM)
	add_child(tankerN)
	add_child(tankerO)
	add_child(tankerP)
	add_child(tankerQ)
	add_child(tankerR)
	add_child(tankerS)
	add_child(tankerT)
	add_child(tankerU)
	add_child(tankerV)
	add_child(tankerW)
	add_child(tankerX)
	add_child(tankerY)
	add_child(tankerZ)
	tankerA.global_position = Vector2(-800,400)
	tankerB.global_position = Vector2(-766,400)
	tankerC.global_position = Vector2(-733,400)
	tankerD.global_position = Vector2(-700,400)
	tankerE.global_position = Vector2(-666,400)
	tankerF.global_position = Vector2(-633,400)
	tankerG.global_position = Vector2(-600,400)
	tankerH.global_position = Vector2(-566,400)
	tankerI.global_position = Vector2(-533,400)
	tankerJ.global_position = Vector2(-500,400)
	tankerK.global_position = Vector2(-466,400)
	tankerL.global_position = Vector2(-433,400)
	tankerM.global_position = Vector2(-400,400)
	tankerN.global_position = Vector2(-800,433)
	tankerO.global_position = Vector2(-766,433)
	tankerP.global_position = Vector2(-733,433)
	tankerQ.global_position = Vector2(-700,433)
	tankerR.global_position = Vector2(-666,433)
	tankerS.global_position = Vector2(-633,433)
	tankerT.global_position = Vector2(-600,433)
	tankerU.global_position = Vector2(-566,433)
	tankerV.global_position = Vector2(-533,433)
	tankerW.global_position = Vector2(-500,433)
	tankerX.global_position = Vector2(-466,433)
	tankerY.global_position = Vector2(-433,433)
	tankerZ.global_position = Vector2(-400,433)
	
	tankerB.control_key = KEY_B
	tankerC.control_key = KEY_C
	tankerD.control_key = KEY_D
	tankerE.control_key = KEY_E
	tankerF.control_key = KEY_F
	tankerG.control_key = KEY_G
	tankerH.control_key = KEY_H
	tankerI.control_key = KEY_I
	tankerJ.control_key = KEY_J
	tankerK.control_key = KEY_K
	tankerL.control_key = KEY_L
	tankerM.control_key = KEY_M
	tankerN.control_key = KEY_N
	tankerO.control_key = KEY_O
	tankerP.control_key = KEY_P
	tankerQ.control_key = KEY_Q
	tankerR.control_key = KEY_R
	tankerS.control_key = KEY_S
	tankerT.control_key = KEY_T
	tankerU.control_key = KEY_U
	tankerV.control_key = KEY_V
	tankerW.control_key = KEY_W
	tankerX.control_key = KEY_X
	tankerY.control_key = KEY_Y
	tankerZ.control_key = KEY_Z
	
	tankerB.get_node("Label").text = "B"
	tankerC.get_node("Label").text = "C"
	tankerD.get_node("Label").text = "D"
	tankerE.get_node("Label").text = "E"
	tankerF.get_node("Label").text = "F"
	tankerG.get_node("Label").text = "G"
	tankerH.get_node("Label").text = "H"
	tankerI.get_node("Label").text = "I"
	tankerJ.get_node("Label").text = "J"
	tankerK.get_node("Label").text = "K"
	tankerL.get_node("Label").text = "L"
	tankerM.get_node("Label").text = "M"
	tankerN.get_node("Label").text = "N"
	tankerO.get_node("Label").text = "O"
	tankerP.get_node("Label").text = "P"
	tankerQ.get_node("Label").text = "Q"
	tankerR.get_node("Label").text = "R"
	tankerS.get_node("Label").text = "S"
	tankerT.get_node("Label").text = "T"
	tankerU.get_node("Label").text = "U"
	tankerV.get_node("Label").text = "V"
	tankerW.get_node("Label").text = "W"
	tankerX.get_node("Label").text = "X"
	tankerY.get_node("Label").text = "Y"
	tankerZ.get_node("Label").text = "Z"
	
	