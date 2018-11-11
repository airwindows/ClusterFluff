extends RigidBody2D

# class member variables go here, for example:
export var speed = 500
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
		if (Input.is_key_pressed(KEY_SPACE)):
			self.apply_impulse(Vector2 (0,0), Vector2(-linear_velocity*10*delta))
	
	
	if (abs(angular_velocity) > 10000.0):
		angular_velocity *= 0.9
	
	if (linear_velocity.length() > 100.0):
		self.apply_impulse(Vector2 (0,0), Vector2(-linear_velocity*delta))
	
	if (Input.is_key_pressed(control_key)):
		$"..".controlled = control_key



func _on_Tanker_body_entered(body):
	if (body.name == "Goal"):
		self.queue_free()
		#self.remove_child($"Label")
	#set this so if you touch the end stage, that player is deleted
	#rather than just deleting the label
	
	
