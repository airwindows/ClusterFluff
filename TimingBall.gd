extends RigidBody2D

func _ready():
	pass

func _physics_process(delta):
	if (self.linear_velocity.length() < 20 && self.position.y > 523):
		self.queue_free()
