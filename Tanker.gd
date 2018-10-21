extends RigidBody2D

# class member variables go here, for example:
export var speed = 100
export(NodePath) var tanker_camera
export var control_key = KEY_A

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var directed_velocity = linear_velocity.rotated(-rotation)
	
	if control_key == $"..".controlled:
		if (Input.is_action_pressed("ui_up")):
			self.apply_impulse(Vector2 (0,0), Vector2(0.0*delta, -speed*delta))
		if (Input.is_action_pressed("ui_down")):
			self.apply_impulse(Vector2 (0,0), Vector2(0.0*delta, speed*delta))
		if (Input.is_action_pressed("ui_left")):
			self.apply_impulse(Vector2 (0,0), Vector2(-speed*delta, 0.0*delta))
		if (Input.is_action_pressed("ui_right")):
			self.apply_impulse(Vector2 (0,0), Vector2(speed*delta, 0.0*delta))
	
	
	if (abs(angular_velocity) > 1.0):
		angular_velocity *= 0.8
	
	if (Input.is_key_pressed(control_key)):
		$"..".controlled = control_key
	
