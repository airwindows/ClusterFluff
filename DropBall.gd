extends Node2D

var vmax = -506
var vposition = -590
var dropvelocity = 0
export var enabled = false

func _process(delta):
	
	if (vposition < vmax && enabled):
		dropvelocity += 1100 * delta
		vposition += dropvelocity * delta
	else:
		dropvelocity = -abs(dropvelocity*0.95)
		vposition += dropvelocity * delta
	
	dropvelocity *= 0.95
	if (abs(dropvelocity) > 60 || vposition < vmax - 1):
		global_position.y = vposition
		

