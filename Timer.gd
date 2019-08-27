extends Node2D

export var framesbetweenupdates = 0.01
onready var warpballTemplate = preload("res://WarpBall.tscn")
onready var scoreballTemplate = preload("res://ScoreBall.tscn")
var warpball=[]
var scoreball=[]

func _ready():
	$"../../Globals".timebonus = 0
	var warpballs = 0
	while (warpballs < 20):
		warpball.append(warpballTemplate.instance())
		add_child(warpball[warpballs])
		warpball[warpballs].global_position  = Vector2( -929 + (warpballs * 59), -560 )
		warpballs += 1
	var scoreballs = 0
	while (scoreballs < 20):
		scoreball.append(scoreballTemplate.instance())
		add_child(scoreball[scoreballs])
		scoreball[scoreballs].global_position  = Vector2( 929 - (scoreballs * 59), -560 )
		scoreballs += 1

func _updateWarpBalls():
	var warpballs = min(floor($"../../Globals".kabonus),19)
	while (warpballs > 0):
		warpballs -= 1
		warpball[warpballs].enabled = true
		
func _gameOver():
	warpball[11].enabled = true
	warpball[11].get_node("Sprite/Label").text = "G"
	warpball[12].enabled = true
	warpball[12].get_node("Sprite/Label").text = "A"
	warpball[13].enabled = true
	warpball[13].get_node("Sprite/Label").text = "M"
	warpball[14].enabled = true
	warpball[14].get_node("Sprite/Label").text = "E"
	warpball[16].enabled = true
	warpball[16].get_node("Sprite/Label").text = "O"
	warpball[17].enabled = true
	warpball[17].get_node("Sprite/Label").text = "V"
	warpball[18].enabled = true
	warpball[18].get_node("Sprite/Label").text = "E"
	warpball[19].enabled = true
	warpball[19].get_node("Sprite/Label").text = "R"

func _updateScoreBalls():
	var scoretext = str($"../../Globals".score)
	var scoreballs = len(scoretext)
	while (scoreballs > 0 && $"../../Globals".score > 0):
		scoreballs -= 1
		scoreball[scoreballs].enabled = true
		scoreball[scoreballs].get_node("Sprite/Label").text = scoretext.substr(len(scoretext)-scoreballs-1,1)

func _physics_process(delta):
	framesbetweenupdates -= delta
	
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		if (get_tree().get_nodes_in_group("Tanker").size() < 1):
			$"../../Globals".level += 1
			$"../../Globals".players += 1
			$"../../Globals".kabonus = 0
			$"../../Globals".factor = 300 + (sqrt(floor($"../../Globals".kabonus)*0.2) * 300)
			get_tree().change_scene("res://GameMap.tscn")
		else:
			if (get_tree().get_nodes_in_group("TimingBall").size() < 1):
				_gameOver()
			else:
				_updateWarpBalls()
			_updateScoreBalls()

