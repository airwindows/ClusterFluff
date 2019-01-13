extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
export var controlled = KEY_A

func _ready():
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
	