extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	print("started")

func _input(event):
	if event.is_action_pressed("ui_left"):
		print("LEFT")
	if event.is_action_pressed("ui_right"):
		print("RIGHT")