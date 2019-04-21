extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
export var segments = [
	"res://SegmentB.tscn", #replace with segment under test, set level % to 1 and stop giving me this crap
	"res://SegmentW.tscn",
	"res://SegmentH.tscn",
	"res://SegmentM.tscn",
	"res://SegmentR.tscn",
	"res://SegmentY.tscn",
	"res://SegmentN.tscn",
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
	"res://SegmentAD.tscn"] #was AD
	#Source Code Bugfix: Script Variables 'Segments' is not updating for each change of the array. It lags. Godot Bug
export var controlled = KEY_A




func _ready():
	
	var t = load(segments[$"../Globals".level % len(segments)]).instance()
	#GameMap is our root so we don't have to go down two levels to get to globals, which are
	#Project/ProjectSettings/Autoloaded at the same level as this very script. Everywhere else we gotta
	#go down two levels like this: $"../../Globals".score
	add_child(t)
	t.global_position = Vector2(-960,-540)
	
	#if $"../Globals".pachinkomode:
	#	$"../Globals".players = $"../Globals".level + 26
	#pachinko mode testing means you always have every player
	
	#Plans: 26 at a time, go through all levels, repeat levels with 26 more
	#Slowly increasing gravity adds difficulty and makes you work at getting all pieces up
	#At some point gravity will be so intense it's no longer possible to complete all pieces
	#and you lose the game
	#As you get warps you also get to hit space while a piece is selected.
	#If you do that, the gravity for that piece is reversed and it lights up and flips upside down
	#so getting warps gives additional importance but lets you switch focus to 'which piece should be pulled upwards'
	#given that speed is retained but you only get 'space = up' enabled when a warp kicks in
	#that also means you want to use it before the next warp hits or it's wasted
	
	#tanker revisit: if 26 ships is so annoying and untrackable, consider the river version
	#but with only two. They can stay visible to each other and it'll not be so disorienting.
	#that's the one where if you gradually add more, one at a time, you ramp difficulty correctly.

	var tankers = []
	var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	
	for i in range($"../Globals".players):
		var letter_index = i % len(alphabet)
		var rank_index = floor(i / len(alphabet))
		var tanker = tankerTemplate.instance()
		add_child(tanker)
		tanker.control_key = KEY_A + letter_index
		tanker.get_node("DotFlare/Pivot/Label").text = alphabet[letter_index]
		tanker.global_position = Vector2(-600 + letter_index * 50, 500 - rank_index * 55)
	