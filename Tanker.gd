extends RigidBody2D

# class member variables go here, for example:
export(NodePath) var tanker_camera
export var control_key = KEY_A

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var lvelocity = Vector2(0,0)
	if control_key == $"..".controlled:
		if (Input.is_action_pressed("ui_up")):
			lvelocity.y = -20
		if (Input.is_action_pressed("ui_down")):
			lvelocity.y = 20
		if (Input.is_action_pressed("ui_left")):
			lvelocity.x = -20
		if (Input.is_action_pressed("ui_right")):
			lvelocity.x = 20
	
	if $"../Timer".countdown > 0:
		self.apply_impulse(Vector2 (0,0), lvelocity)
		self.apply_impulse(Vector2 (0,0), -(linear_velocity - (linear_velocity.normalized()*200)))
	else:
		self.apply_impulse(Vector2 (0,0), Vector2 (0,delta*300))
		
	self.angular_velocity *= (1.0-delta)
	
	if (self.position.y < -530):
		var children = get_parent().get_children()
		var tankers = 0
		for i in children:
			if i.is_in_group("Tanker"):
				tankers += 1
		if (tankers == 1):
			$"../Timer".ticking = false
			print("YOU WIN YAAAAY")
		$"../Timer".score += int($"../Timer".countdown)
		self.queue_free()
	
	if (Input.is_key_pressed(control_key)):
		$"..".controlled = control_key

