extends KinematicBody2D

const TURN_SPEED = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$spr_spaceShip/spr_propulsionFire.hide()
	if (Input.is_action_pressed("ui_left")):
		rotation_degrees -= TURN_SPEED * delta
	elif (Input.is_action_pressed("ui_right")):
		rotation_degrees += TURN_SPEED * delta
