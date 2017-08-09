extends Node2D

onready var spaceShip = get_node("spr_spaceShip")

func _ready():
	print("started")
	set_process(true)

func _process(delta):
	if Input.is_action_pressed("ui_left"):
		spaceShip.rotate(-0.05)
		print("LEFT")
	if Input.is_action_pressed("ui_right"):
		spaceShip.rotate(0.05)
		print("RIGHT")