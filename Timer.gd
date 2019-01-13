extends Label

export var completedlevel = false
export var countdown = 0.0
export var framesbetweenupdates = 0.01

func _ready():
	countdown = 121

func _physics_process(delta):
	if !(completedlevel && $"../../../Globals".pachinkomode):
		countdown -= delta
	framesbetweenupdates -= delta
	
	if (completedlevel):
		if (Input.is_action_pressed("ui_accept")):
			$"../../../Globals".bonus = 99
			$"../../../Globals".level += 1
			get_tree().change_scene("res://GameMap.tscn")
	
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		if countdown > 0:
			self.text = "Time:" + str(int(countdown)) + " warp " +str(int($"../../../Globals".kabonus)) + " bonuses " +str(int($"../../../Globals".bonus/100)) + " Score:" + str(int($"../../../Globals".score))
				#this is added on top of the bonus dings and doesn't cut back bonuses 
			
			if $"../../../".has_node("TankerA"):
				self.text = "ALERT ALERT"
			
			if (completedlevel && $"../../../Globals".bonus < 100 && $"../../../Globals".kabonus > 0):
					$"../../../Globals".kabonus -= 1
					$"../../../Globals".bonus += 1000
					
			if (completedlevel && $"../../../Globals".bonus > 99):
				#ding! if we're done with the kabonuses
				$"../../../Globals".score += 100
				$"../../../Globals".bonus -= 100
				if ($"../../../Globals".players < 25):
					$"../../../Globals".players += 1

			$"../../../Globals".factor = 200 + (sqrt($"../../../Globals".kabonus+1) * 100)
			#we must update factor each time we change this, so the speed can return to normal on reset
			if ($"../../../Globals".pachinkomode):
				$"../../../Globals".factor = 2000
			#this sets factor super-high for pachinko mode level testing
		#this is our ringing up of bonus guys and points
		#you can interrupt the bonus ring-up if you're running low on time, and it'll save them for the next level
		else:
			if (completedlevel):
				$"../../../Globals".bonus = 99
				$"../../../Globals".level += 1
				get_tree().change_scene("res://GameMap.tscn")
				#out of time and we completed the level: thrown into next level
			else:
				self.text = "Game Over warp " +str(int($"../../../Globals".kabonus)) + " bonuses " +str(int($"../../../Globals".bonus/100)) + " Score:" + str(int($"../../../Globals".score))
				#out of time and uncomplete: we will rack up the final score as we're still ticking away the clock
				if ($"../../../Globals".kabonus > 0):
					#boom!
					$"../../../Globals".score += 1000
					$"../../../Globals".kabonus -= 1
					#this is added on top of the bonus dings and doesn't cut back bonuses
				
				if ($"../../../Globals".bonus > 99 && $"../../../Globals".kabonus < 1):
					#ding! if we're done with the kabonuses
					$"../../../Globals".score += 100
					$"../../../Globals".bonus -= 100
		