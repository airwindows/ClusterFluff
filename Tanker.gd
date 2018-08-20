extends RigidBody2D

# class member variables go here, for example:
export var momentum_forward = 0
export var momentum_turn = 0
export(NodePath) var tanker_camera
export var control_key = KEY_A

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var directed_velocity = linear_velocity.rotated(-rotation)
	
	if get_node("Camera2D").current == true:
		if (Input.is_action_pressed("ui_up")):
			momentum_forward -= 10
		if (Input.is_action_pressed("ui_down")):
			momentum_forward += 10
		if (Input.is_action_pressed("ui_left")):
			momentum_turn += 10
		if (Input.is_action_pressed("ui_right")):
			momentum_turn -= 10
	momentum_forward *= 0.9
	momentum_turn += (angular_velocity*2.0)
	momentum_turn *= 0.9
	
	momentum_turn += (self.rotation * abs(angular_velocity) * 0.5)
	#steer towards straight up if twirling off line
	momentum_turn += (self.rotation * abs(linear_velocity.length() * 0.005))
	#steer towards straight up if going really fast
	#will be arranging segments so that there's generally room to go up
	
	if (abs(angular_velocity) > 1.0):
		angular_velocity *= 0.8
	
	if (Input.is_key_pressed(control_key)):
		get_node("Camera2D").current = true
	
	directed_velocity.y = 0
	directed_velocity.x *= -delta
	
	self.apply_impulse(Vector2 (0,0), (directed_velocity.rotated(rotation)*2))
	self.apply_impulse(Vector2 (0,0), Vector2(0.0, momentum_forward*delta).rotated(rotation))
	self.apply_impulse(Vector2 (0,10), Vector2 (momentum_turn*delta,0.0))
	self.apply_impulse(Vector2 (0,-10), Vector2 (-momentum_turn*delta,0.0))

