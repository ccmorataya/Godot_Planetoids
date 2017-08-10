extends Node2D

const speed = 4
#onready var spaceShip = get_node("spr_spaceShip")
onready var spaceShip = get_node("kbdy_spaceShip")
onready var propulsionFire = get_node("kbdy_spaceShip/spr_spaceShip/spr_propulsionFire")
var direction = Vector2(0,0)

func _ready():
	print("started")
	set_fixed_process(true)

func _fixed_process(delta):
	propulsionFire.hide()
	
	if Input.is_action_pressed("ui_left"):
		spaceShip.rotate(-0.05)
		print("LEFT");
	if Input.is_action_pressed("ui_right"):
		spaceShip.rotate(0.05)
		print("RIGHT");
	
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0,-1)
		propulsionFire.show()
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0,1)
		
	spaceShip.move(direction * delta * speed)