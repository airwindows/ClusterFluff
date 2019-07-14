extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	if (self.linear_velocity.length() < 16): # || self.position.y < -535):
		#if (self.position.y > 531 || self.position.x < -980 || self.position.x > 980):
		#to avoid glitches, count any departure from the screen as a win
		var children = get_parent().get_children()
		var timingballs = 0
		for i in children:
			if i.is_in_group("TimingBall"):
				timingballs += 1
		if (timingballs < 2):
			$"../TopLayer/Timer".completedlevel = true
		self.queue_free()

