extends Node2D
onready var tankerTemplate = preload("res://Tanker.tscn")
onready var timingballTemplate = preload("res://TimingBall.tscn")
export var segments = [
	"res://SegmentW.tscn",
	"res://SegmentY.tscn",
	"res://SegmentH.tscn",
	"res://SegmentO.tscn",
	"res://SegmentM.tscn",
	"res://SegmentL.tscn",
	"res://SegmentAA.tscn",
	"res://SegmentE.tscn",
	"res://SegmentG.tscn",
	"res://SegmentK.tscn",
	"res://SegmentC.tscn",
	"res://SegmentN.tscn",
	"res://SegmentAC.tscn",
	"res://SegmentF.tscn",
	"res://SegmentAF.tscn",
	"res://SegmentU.tscn",
	"res://SegmentA.tscn",
	"res://SegmentAB.tscn",
	"res://SegmentP.tscn",
	"res://SegmentD.tscn"] #20 levels
export var controlled = KEY_A
export var shiftituded = false

func _ready():
	var tankers = []
	var timingballs = []
	var alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	var t = load(segments[$"../Globals".level % len(segments)]).instance()
	add_child(t)
	t.global_position = Vector2(-960,-540)
	
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
	
	for i in range (sqrt($"../Globals".players)):
		var timingball = timingballTemplate.instance()
		add_child(timingball)
		timingball.global_position = Vector2( 0, 0 )
		timingball.linear_velocity = Vector2( randf()-0.5, randf()-0.5 ).normalized() * 800
