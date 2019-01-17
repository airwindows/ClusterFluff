extends Label

export var completedlevel = false
export var countdown = 0.0
export var framesbetweenupdates = 0.01

func _ready():
	countdown = 61

func _physics_process(delta):
	if !(completedlevel && $"../../../Globals".pachinkomode):
		countdown -= delta
	framesbetweenupdates -= delta
	
	if (completedlevel):
		if (Input.is_action_pressed("ui_accept")):
			$"../../../Globals".level += 1
			$"../../../Globals".players += 1
			$"../../../Globals".kabonus = 0
			get_tree().change_scene("res://GameMap.tscn")
	
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		if countdown > 0:
			self.text = "Time:" + str(int(countdown)) + " warp " +str(int($"../../../Globals".kabonus)) + " Score:" + str(int($"../../../Globals".score))
			$"../../../Globals".factor = 300 + (sqrt(floor($"../../../Globals".kabonus)*0.2) * 200)
			#we must update factor each time we change this, so the speed can return to normal on reset

			if ($"../../../Globals".pachinkomode):
				$"../../../Globals".factor = 4000
			#this sets factor super-high for pachinko mode level testing
		else:
			if (completedlevel):
				$"../../../Globals".level += 1
				$"../../../Globals".players += 1
				$"../../../Globals".kabonus = 0
				get_tree().change_scene("res://GameMap.tscn")
				#out of time and we completed the level: thrown into next level
			else:
				self.text = "Time:0 warp " +str(int($"../../../Globals".kabonus)) + " Score:" + str(int($"../../../Globals".score))
				#out of time and uncomplete: we will rack up the final score as we're still ticking away the clock