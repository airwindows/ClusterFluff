extends RigidBody2D

export(NodePath) var tanker_camera
export var control_key = KEY_A

func _physics_process(delta):
	var lvelocity = Vector2(0,0)
	if control_key == $"..".controlled:
		if (Input.is_action_pressed("ui_up")):
			lvelocity.y = -20
			self.angular_velocity *= (1.0-delta)
		if (Input.is_action_pressed("ui_down")):
			lvelocity.y = 20
			self.angular_velocity *= (1.0-delta)
		if (Input.is_action_pressed("ui_left")):
			lvelocity.x = -20
			self.angular_velocity *= (1.0-delta)
		if (Input.is_action_pressed("ui_right")):
			lvelocity.x = 20
			self.angular_velocity *= (1.0-delta)
	
	if $"../TopLayer/Timer".countdown > 0:
		self.apply_impulse(Vector2 (0,0), lvelocity)
		self.apply_impulse(Vector2 (0,0), -(linear_velocity - (linear_velocity.normalized() * $"../../Globals".factor)))
	else:
		self.apply_impulse(Vector2 (0,0), Vector2 (0,delta*200))
		self.angular_velocity *= (1.0-delta)
	
	$DotFlare.rotation_degrees = -$".".rotation_degrees - ($"../TopLayer/Timer".framesbetweenupdates*12)
	
	if (self.position.y < -530):
		var children = get_parent().get_children()
		var tankers = 0
		for i in children:
			if i.is_in_group("Tanker"):
				tankers += 1
		if (tankers < 2):
			$"../TopLayer/Timer".completedlevel = true #should be able to override running out of time and losing controls
		
		$"../../Globals".score += int($"../TopLayer/Timer".countdown)
		$"../../Globals".bonus += int($"../TopLayer/Timer".countdown)
		
		if ($"../../Globals".bonus > 1000):
			$"../../Globals".kabonus += 1
			$"../../Globals".bonus -= 1000
			
		self.queue_free()
	
	if (Input.is_key_pressed(control_key)):
		$"..".controlled = control_key

