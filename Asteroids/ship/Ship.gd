extends RigidBody2D

export(float) var engineThrust = 200
export(float) var spinThrust = 2000

var thrust = Vector2()
var rotationDir = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		thrust = Vector2(engineThrust, 0)
	else:
		 thrust = Vector2()
	
	if Input.is_action_pressed("ui_left"):
		rotationDir = -1
	elif Input.is_action_pressed("ui_right"):
		rotationDir = 1
	else:
		rotationDir = 0
#
#	print(delta)
	pass

func _integrate_forces(state):
	set_applied_force(thrust.rotated(rotation))
	set_applied_torque(rotationDir * spinThrust)
	pass