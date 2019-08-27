extends RigidBody2D
var size = 1.0
var cycle = true

func _physics_process(delta):
	self.scale.x = size
	self.scale.y = size
	cycle = !cycle
	if cycle:
		if self.linear_velocity.x > 0:
			self.linear_velocity.x -= (delta*16)
		else:
			self.linear_velocity.x += (delta*16)
		$CollisionShape2D.scale.x = size
		if (self.scale.x < 0.20):
			self.queue_free()
	else:
		if self.linear_velocity.y > 0:
			self.linear_velocity.y -= (delta*16)
		else:
			self.linear_velocity.y += (delta*16)
		$CollisionShape2D.scale.y = size
		if (self.linear_velocity.length() < (100-(60*size))):
			size -= ((1.00001 - size)*delta*8)
		else:
			size = (size+1.0)*0.5
