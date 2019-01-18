extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
export var segments = [
	"res://SegmentB.tscn", #replace with segment under test, set level % to 1
	"res://SegmentW.tscn",
	"res://SegmentH.tscn",
	"res://SegmentS.tscn",
	"res://SegmentM.tscn",
	"res://SegmentR.tscn",
	"res://SegmentY.tscn",
	"res://SegmentN.tscn",
	"res://SegmentV.tscn",
	"res://SegmentAA.tscn",
	"res://SegmentG.tscn",
	"res://SegmentL.tscn",
	"res://SegmentO.tscn",
	"res://SegmentJ.tscn",
	"res://SegmentF.tscn",
	"res://SegmentZ.tscn",
	"res://SegmentP.tscn",
	"res://SegmentA.tscn",
	"res://SegmentI.tscn",
	"res://SegmentAE.tscn",
	"res://SegmentX.tscn",
	"res://SegmentAC.tscn",
	"res://SegmentQ.tscn",
	"res://SegmentAF.tscn",
	"res://SegmentAB.tscn",
	"res://SegmentE.tscn",
	"res://SegmentK.tscn",
	"res://SegmentT.tscn",
	"res://SegmentC.tscn",
	"res://SegmentD.tscn",
	"res://SegmentU.tscn",
	"res://SegmentAD.tscn",
	"res://SegmentAD.tscn"]
	#got an extra in case the math gives us higher numbers
export var controlled = KEY_A

func _ready():
	
	var t = load(segments[$"../Globals".level % 32]).instance()
	#GameMap is our root so we don't have to go down two levels to get to globals, which are
	#Project/ProjectSettings/Autoloaded at the same level as this very script. Everywhere else we gotta
	#go down two levels like this: $"../../Globals".score
	add_child(t)
	t.global_position = Vector2(-960,-540)
	
	#if $"../Globals".pachinkomode:
	#	$"../Globals".players = $"../Globals".level + 26
	#pachinko mode testing means you always have every player

	var tankers = []
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	
	for i in range($"../Globals".players):
		var letter_index = i % len(alphabet)
		var rank_index = floor(i / len(alphabet))
		var tanker = tankerTemplate.instance()
		add_child(tanker)
		tanker.control_key = KEY_A + letter_index
		tanker.get_node("DotFlare/Label").text = alphabet[letter_index]
		tanker.global_position = Vector2(-600 + letter_index * 50, 500 - rank_index * 55)
	