extends RigidBody2D

export(NodePath) var tanker_camera
export var control_key = KEY_A
export var shiftitude = false
var thisGravity = 3
var gravityCheck = 0


func _ready():
	self.apply_impulse(Vector2 (0,0), Vector2 (1,0))

func _physics_process(delta):
	var lvelocity = Vector2(0,0)
	var beingcontrolled = false
	if (control_key == $"..".controlled && shiftitude == $"..".shiftituded && $"../TopLayer/Timer".countdown > 0):
		if (Input.is_action_pressed("ui_up")):
			lvelocity.y = $"../../Globals".factor * -0.12
			self.angular_velocity *= (1.0-delta)
			beingcontrolled = true
		if (Input.is_action_pressed("ui_down")):
			lvelocity.y = $"../../Globals".factor * 0.12
			self.angular_velocity *= (1.0-delta)
			beingcontrolled = true
		if (Input.is_action_pressed("ui_left")):
			lvelocity.x = $"../../Globals".factor * -0.12
			self.angular_velocity *= (1.0-delta)
			beingcontrolled = true
		if (Input.is_action_pressed("ui_right")):
			lvelocity.x = $"../../Globals".factor * 0.12
			self.angular_velocity *= (1.0-delta)
			beingcontrolled = true
		if (Input.is_action_pressed("ui_accept") && $"../../Globals".kabonus > 1.0 && thisGravity > 0):
			$"../../Globals".kabonus -= 1.0
			thisGravity = -20
			
	if ((control_key == $"..".controlled && shiftitude == $"..".shiftituded && $"../TopLayer/Timer".countdown > 0) || thisGravity < 0):
		$DotFlare.rotation_degrees = -$".".rotation_degrees
		var licht = ($"../TopLayer/Timer".framesbetweenupdates * 4.4)
		licht = pow(licht,4)
		$DotFlare/Pivot/Label.add_color_override("font_color", Color(licht,licht,licht,1))
		$DotFlare.scale = Vector2(2.5,2.5)
	else:
		$DotFlare.rotation_degrees = -$".".rotation_degrees
		$DotFlare/Pivot/Label.add_color_override("font_color", Color(0,0,0,1))
		$DotFlare.scale = Vector2(2.2,2.2)
	
	if (thisGravity < 0 && gravityCheck < 180):
		gravityCheck += (delta * 800)
		$DotFlare/Pivot.rotation_degrees = min(gravityCheck,180)
		
	
	
	self.apply_impulse(Vector2 (0,0), Vector2 (0,delta*(thisGravity*(60-$"../TopLayer/Timer".countdown))))
	self.apply_impulse(Vector2 (0,0), lvelocity)
	self.apply_impulse(Vector2 (0,0), -(linear_velocity - (linear_velocity.normalized() * $"../../Globals".factor)))
	
	if (self.position.y < -535 || self.position.y > 560 || self.position.x < -980 || self.position.x > 980):
		#to avoid glitches, count any departure from the screen as a win
		var children = get_parent().get_children()
		var tankers = 0
		for i in children:
			if i.is_in_group("Tanker"):
				tankers += 1
		if (tankers < 2):
			$"../TopLayer/Timer".completedlevel = true
		$"../../Globals".score += int($"../TopLayer/Timer".countdown)
		$"../../Globals".kabonus += $"../TopLayer/Timer".countdown * 0.005
		self.queue_free()
	
	if (Input.is_key_pressed(control_key)):
		if (Input.is_key_pressed(KEY_SHIFT) == shiftitude):
			$"..".controlled = control_key
			$"..".shiftituded = shiftitude

