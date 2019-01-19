extends Label

export var completedlevel = false
export var countdown = 0.0
export var framesbetweenupdates = 0.01
var insanitycheck = 0

func _ready():
	countdown = 61 + $"../../../Globals".timebonus
	$"../../../Globals".timebonus = 0

func _physics_process(delta):
	#if !(completedlevel): # && $"../../../Globals".pachinkomode
	countdown -= delta
	framesbetweenupdates -= delta
	
	if (completedlevel):
		if (Input.is_action_pressed("ui_accept")): # || $"../../../Globals".pachinkomode
			#if ($"../../../Globals".pachinkomode):
			#	$"../../../Globals".segmentcounts[$"../../../Globals".level % 32] += (60.0 - countdown)
			#	self.text = str($"../../../Globals".segmentcounts[$"../../../Globals".level % 32] / (floor(($"../../../Globals".level / 32) + 1))).pad_zeros(3) + "  " + $"../../".segments[$"../../../Globals".level % 32]
			#	print(self.text) #this was for ranking levels by hardness
			$"../../../Globals".level += 1
			$"../../../Globals".players += 1
			$"../../../Globals".kabonus = 0
			$"../../../Globals".timebonus += (countdown * 0.5)
			get_tree().change_scene("res://GameMap.tscn")
	
	if framesbetweenupdates < 0:
		framesbetweenupdates = 0.25
		insanitycheck += 1
		if (insanitycheck > 20):
			insanitycheck = 0
			var children = get_parent().get_parent().get_children()
			var tankers = 0
			for i in children:
				if i.is_in_group("Tanker"):
					tankers += 1
			if (tankers < 1):
				completedlevel = true
		if (countdown > 0): # || $"../../../Globals".pachinkomode
			self.text = "Time:" + str(int(countdown)) + " warp " +str(int($"../../../Globals".kabonus)) + " Score:" + str(int($"../../../Globals".score))
			$"../../../Globals".factor = 300 + (sqrt(floor($"../../../Globals".kabonus)*0.2) * 200)
			#we must update factor each time we change this, so the speed can return to normal on reset
			#if ($"../../../Globals".pachinkomode):
			#	$"../../../Globals".factor = 3000
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