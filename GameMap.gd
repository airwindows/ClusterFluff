extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
onready var timingballTemplate = preload("res://TimingBall.tscn")
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
	#in which you can change stuff like array size, but have to change the name of the tree to get the game to update.
export var controlled = KEY_A
export var shiftituded = false

func _ready():
	
	var t = load(segments[$"../Globals".level % len(segments)]).instance()
	#GameMap is our root so we don't have to go down two levels to get to globals, which are
	#Project/ProjectSettings/Autoloaded at the same level as this very script. Everywhere else we gotta
	#go down two levels like this: $"../../Globals".score
	add_child(t)
	t.global_position = Vector2(-960,-540)
	
	#next phase notes
	#could the spacebar 'up' and piece-flip be a tradeoff, removing the warp and the excess speed? That would bring overall speeds down
	#as you applied reverse-gravity. And that would alter gameplay: do you do better controlling pieces, or letting them go bonkers?
	#Too fast is unmanageable, and too fast plus gravity is not an automatic win.
	
	#Score can flash into brightness when more score is added. Middle of the screen, maybe? Can it get larger as it increases, beginning tiny?
	#Can we have a better font? I can hand-draw one like Jinx Handlettering, but bolder, more a label font.
	#Warps have up-arrow on them and gather at the top of the screen
	#Warps appear at the top but don't collide with the same things? Not pieces or board, but they are kept within the boundaries of the screen
	#and are rendered on top of the gameplay.
	
	
	#tanker revisit: if 26 ships is so annoying and untrackable, consider the river version
	#but with only two. They can stay visible to each other and it'll not be so disorienting.
	#that's the one where if you gradually add more, one at a time, you ramp difficulty correctly.

	var tankers = []
	var timingballs = []
	var alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	
	for i in range($"../Globals".players):
		var letter_index = i % 26
		var display_index = i % 52
		var rank_index = int(floor(i / 26))
		var tanker = tankerTemplate.instance()
		add_child(tanker)
		tanker.control_key = KEY_A + letter_index
		tanker.shiftitude = (rank_index % 2) == 1
		tanker.get_node("DotFlare/Pivot/Label").text = alphabet[display_index]
		tanker.global_position = Vector2(-600 + letter_index * 50, 500 - rank_index * 55)
	
	for i in range ($"../Globals".timingballs):
		var timingball = timingballTemplate.instance()
		add_child(timingball)
		timingball.global_position = Vector2( 0, 0 )
		timingball.linear_velocity = Vector2( randf()-0.5, randf()-0.5 ).normalized() * 800
		
	