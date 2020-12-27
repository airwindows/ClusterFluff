extends RigidBody2D
var size = 1.0
var cycle = true

func _physics_process(delta):
	self.scale.x = size
	self.scale.y = size
	cycle = !cycle
	if cycle:
		if self.linear_velocity.x > 0:
			self.linear_velocity.x -= delta
		else:
			self.linear_velocity.x += delta
		$CollisionShape2D.scale.x = size
		if (self.scale.x < 0.10):
			self.queue_free()
	else:
		if self.linear_velocity.y > 0:
			self.linear_velocity.y -= delta
		else:
			self.linear_velocity.y += delta
		$CollisionShape2D.scale.y = size
		if (self.linear_velocity.length() < (150-(60*size))):
			size -= ((1.0000001 - size)*delta)
		else:
			size = (size+1.0)*0.5
