extends Label

export var framesbetweenupdates = 0.01
onready var warpballTemplate = preload("res://WarpBall.tscn")
var warpballs = []

func _ready():
	$"../../../Globals".timebonus = 0
	
func _redrawWarpBalls():
	for ball in get_tree().get_nodes_in_group("WarpBall"):
		ball.queue_free()
	var warpballs = floor($"../../../Globals".kabonus)
	while (warpballs > 0):
		warpballs -= 1
		var warpball = warpballTemplate.instance()
		add_child(warpball)
		warpball.global_position  = Vector2( -929 + (warpballs * 59), -506 )
	
func _redrawScoreBalls():
	#for ball in get_tree().get_nodes_in_group("WarpBall"):
	#	ball.queue_free()
	var warpballs = floor($"../../../Globals".kabonus)
	while (warpballs > 0):
		warpballs -= 1
		var warpball = warpballTemplate.instance()
		add_child(warpball)
		warpball.global_position  = Vector2( 929 - (warpballs * 59), -506 )
	
	
func _physics_process(delta):
	framesbetweenupdates -= delta
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		if (get_tree().get_nodes_in_group("Tanker").size() < 1):
			$"../../../Globals".level += 1
			if ($"../../../Globals".level % len($"../../../Node2D".segments) == 0):
				$"../../../Globals".players += 26
			$"../../../Globals".kabonus = 0
			$"../../../Globals".factor = 300 + (sqrt(floor($"../../../Globals".kabonus)*0.2) * 200)
			get_tree().change_scene("res://GameMap.tscn")
		else:
			self.text = str(int($"../../../Globals".score))
			_redrawWarpBalls()
			_redrawScoreBalls()

