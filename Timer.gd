extends Label

# class member variables go here, for example:
export var ticking = true
export var countdown = 0
export var increment = 0
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	countdown = 300
	increment = 300

func _process(delta):
#	# Called every frame. Delta is time since last frame.
	if (ticking):
		countdown -= delta
		
	if (countdown < increment):
		self.text = str(int(increment))
		increment = countdown-1
#	# Update game logic here.
#	pass
