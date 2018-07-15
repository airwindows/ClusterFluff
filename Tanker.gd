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
	momentum_forward *= 0.95
	momentum_turn *= 0.7
	
	if (Input.is_key_pressed(control_key)):
		get_node("Camera2D").current = true
	
	directed_velocity.y = 0
	directed_velocity.x *= -delta
	
	self.apply_impulse(Vector2 (0,0), directed_velocity.rotated(rotation))
	self.apply_impulse(Vector2 (0,0), Vector2(0.0, momentum_forward*delta).rotated(rotation))
	self.apply_impulse(Vector2 (0,10), Vector2 (momentum_turn*delta,0.0))
	self.apply_impulse(Vector2 (0,-10), Vector2 (-momentum_turn*delta,0.0))

