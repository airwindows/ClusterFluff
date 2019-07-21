extends RigidBody2D

func _ready():
	pass

func _physics_process(delta):
	if (self.linear_velocity.length() < self.position.y * 0.03):
		self.queue_free()
