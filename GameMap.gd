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
	#Time remaining are blank and perhaps much smaller, and gather at the bottom of the screen
	#Maybe they're along a horizontal line, but they are in motion, gravity pulling them towards the center, and they bounce like one of those
	#Newton's Cradle steel-ball things.
	#Warps appear at the top but don't collide with the same things? Not pieces or board, but they are kept within the boundaries of the screen
	#and are rendered on top of the gameplay.
	#Time increments, smaller, are the same way, also don't collide (except with each other) but are dumped from the top. Maybe they DO collide with everything
	#but you can't control them, or they have more gravity? Maybe they are giant grains of sand and the game is an hourglass: you see them ticking away and dropping
	#out of the game area. You look down for status of what's not done yet, that's a natural place for timing pieces.
	#If they are smaller, they'll knock game pieces up.
	#If you can collide with them but not control them, then you can try to knock them away from the central drain (we have room for some more stuff at bottom and can
	#move the pieces up if needed)
	#Then, in end-game, you can play 'keep the timing pieces away from the drain' to get extra time, but your pieces have to go UP to win, taking them away from the
	#timing pieces. Maybe the bottom of the screen is a device that lets in the timing pieces one at a time and crushes them to dust!
	
	
	#tanker revisit: if 26 ships is so annoying and untrackable, consider the river version
	#but with only two. They can stay visible to each other and it'll not be so disorienting.
	#that's the one where if you gradually add more, one at a time, you ramp difficulty correctly.

	var tankers = []
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
	