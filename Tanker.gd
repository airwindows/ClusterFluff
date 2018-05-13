extends RigidBody2D

# class member variables go here, for example:
export var momentum_forward = 0
export var momentum_turn = 0
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
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
	
	var directed_velocity = linear_velocity.rotated(-rotation)
	var turn_factor = directed_velocity.y * -0.02
	directed_velocity.y = 0
	directed_velocity.x *= -delta
	
	self.apply_impulse(Vector2 (0,0), directed_velocity.rotated(rotation))
	self.apply_impulse(Vector2 (0,0), Vector2(0.0, momentum_forward*delta).rotated(rotation))
	self.apply_impulse(Vector2 (0,10), Vector2 (momentum_turn*delta*turn_factor,0.0))
	self.apply_impulse(Vector2 (0,-10), Vector2 (-momentum_turn*delta*turn_factor*0.5,0.0))

