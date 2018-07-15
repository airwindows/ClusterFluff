extends Node2D
onready var segmentA = preload("res://root.tscn")

func _ready():
	var tileA = segmentA.instance()
	var tileB = segmentA.instance()
	
	add_child(tileA)
	add_child(tileB)
	tileB.global_position = Vector2(0,500)