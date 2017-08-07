extends Node2D

onready var spaceShip = get_node("spr_spaceShip")

func _ready():
	print("started")

func _input(event):
	if event.is_action_pressed("ui_left"):
		spaceShip.rotate(-0.5)
		print("LEFT")
	if event.is_action_pressed("ui_right"):
		spaceShip.rotate(0.5)
		print("RIGHT")