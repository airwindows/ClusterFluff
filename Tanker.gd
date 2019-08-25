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
	var remainingTimingBalls = get_tree().get_nodes_in_group("TimingBall").size()
	if (control_key == $"..".controlled && shiftitude == $"..".shiftituded && remainingTimingBalls > 0):
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
			
	if ((control_key == $"..".controlled && shiftitude == $"..".shiftituded && remainingTimingBalls > 0) || thisGravity < 0):
		$DotFlare.rotation_degrees = -$".".rotation_degrees
		var licht = ($"../TopLayer".framesbetweenupdates * 4.0)
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
	
	self.apply_impulse(Vector2 (0,0), Vector2 (0,delta*(thisGravity*($"../../Globals".timingballs-remainingTimingBalls))))
	self.apply_impulse(Vector2 (0,0), lvelocity)
	if (remainingTimingBalls > 0):
		self.apply_impulse(Vector2 (0,0), -(linear_velocity - (linear_velocity.normalized() * $"../../Globals".factor)))
	
	if (self.position.y < -535 || self.position.y > 560 || self.position.x < -980 || self.position.x > 980):
		#to avoid glitches, count any departure from the screen as a win
		$"../../Globals".score += int(remainingTimingBalls)
		$"../../Globals".kabonus += remainingTimingBalls * 0.001
		$"../../Globals".factor = 300 + (sqrt(floor($"../../Globals".kabonus)*0.2) * 200)
		self.queue_free()
	
	if (Input.is_key_pressed(control_key)):
		if (Input.is_key_pressed(KEY_SHIFT) == shiftitude):
			$"..".controlled = control_key
			$"..".shiftituded = shiftitude

