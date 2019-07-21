extends Label

export var completedlevel = false
export var framesbetweenupdates = 0.01

func _ready():
	$"../../../Globals".timebonus = 0

func _physics_process(delta):
	framesbetweenupdates -= delta
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		if (get_tree().get_nodes_in_group("Tanker").size() < 1):
			completedlevel = true
			
		if (completedlevel):
			$"../../../Globals".level += 1
			$"../../../Globals".players += 1 ###do we want players to increase by one?
			$"../../../Globals".kabonus = 0
			get_tree().change_scene("res://GameMap.tscn")
		else:
			self.text = str(int($"../../../Globals".kabonus)) + " | " + str(int($"../../../Globals".score))
	
	if (completedlevel):
		$"../../../Globals".level += 1
		if ($"../../../Globals".level % len($"../../../Node2D".segments) == 0): $"../../../Globals".players += 26
		$"../../../Globals".kabonus = 0
		get_tree().change_scene("res://GameMap.tscn")

