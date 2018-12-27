extends Label

export var ticking = true
export var countdown = 0.0
var framesbetweenupdates = 10

func _ready():
	countdown = 61

func _process(delta):
	if (ticking):
		countdown -= delta
		framesbetweenupdates -= 1
	
	if framesbetweenupdates < 0:
		framesbetweenupdates = 10
		if countdown > 0:
			self.text = "Time:" + str(int(countdown)) + "  Level:" +str(int($"../../../Globals".level+1)) + "  Score:" + str(int($"../../../Globals".score))
		else:
			self.text = "Time:0  Level: " + str(int($"../../../Globals".level+1)) + "  Score:" + str(int($"../../../Globals".score))