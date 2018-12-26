extends Label

# class member variables go here, for example:
export var ticking = true
export var countdown = 0
export var score = 0
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	countdown = 11

func _process(delta):
#	# Called every frame. Delta is time since last frame.
	if (ticking):
		countdown -= delta
	
	if countdown > 0:
		self.text = str(int(countdown)) + " - " + str(int(score))
	else:
		self.text = "0 - " + str(int(score))