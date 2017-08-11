extends Node2D

const speed = 4
#onready var spaceShip = get_node("spr_spaceShip")
onready var spaceShip = get_node("kbdy_spaceShip")
onready var propulsionFire = get_node("kbdy_spaceShip/spr_spaceShip/spr_propulsionFire")
onready var quitGame = get_node("cnfd_quitGame")
onready var head = spaceShip.get_node("spr_head")
var direction = Vector2(0,0)

func _ready():
	print("started")
	set_fixed_process(true)

func _fixed_process(delta):
	print(head.get_global_position())
	propulsionFire.hide()
	
	if Input.is_action_just_pressed("ui_quit"):
		get_tree().set_pause(true)
		quitGame.show()
	
	if Input.is_action_pressed("ui_left"):
		spaceShip.rotate(-0.05)
	if Input.is_action_pressed("ui_right"):
		spaceShip.rotate(0.05)
	
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(head.get_global_position().x-512,-1)
		propulsionFire.show()
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(head.get_global_position().x-512,1)
		
	spaceShip.move(direction * delta * speed)

	var cancel = quitGame.get_cancel()
	cancel.connect("button_down", self, "resume_game")

func resume_game():
	get_tree().set_pause(false)

func _on_cnfd_quitGame_confirmed():
	get_tree().quit()
	pass