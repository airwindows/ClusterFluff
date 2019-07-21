extends RigidBody2D

func _ready():
	pass

func _physics_process(delta):
	if (self.linear_velocity.length() < 16): # || self.position.y < -535):
		#if (self.position.y > 531 || self.position.x < -980 || self.position.x > 980):
		var children = get_parent().get_children()
		var timingballs = 0
		for i in children:
			if i.is_in_group("TimingBall"):
				timingballs += 1
		self.queue_free()

