extends Node2D

const speed = 4
#onready var spaceShip = get_node("spr_spaceShip")
onready var spaceShip = get_node("kbdy_spaceShip")
onready var propulsionFire = get_node("kbdy_spaceShip/spr_spaceShip/spr_propulsionFire")
onready var quitGame = get_node("cnfd_quitGame")
onready var head = spaceShip.get_node("spr_head")
var direction = Vector2(0,0)

func _ready():
	init_stars()

func init_stars():
	randomize()
	for i in range(25):
		var x = floor(rand_range(1, 1025))
		var y = floor(rand_range(1, 769))
		var starScene = preload("res://scenes/Star.tscn")
		var starNode = starScene.instance()
		add_child(starNode)
		var positionVector = Vector2(x,y)
		starNode.set_position(positionVector)
	print("started")
	set_physics_process(true)
	var cancel = quitGame.get_cancel()
	cancel.connect("button_down", self, "resume_game")

func _physics_process(delta):
	var max_direction = 100
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
	
	if spaceShip.position.x > get_viewport().size.x:
		spaceShip.position.x = 0
	elif spaceShip.position.x <= 0:
		spaceShip.position.x = get_viewport().size.x
	if spaceShip.position.y > get_viewport().size.y:
		spaceShip.position.y = 0
	elif spaceShip.position.y <= 0:
		spaceShip.position.y = get_viewport().size.y
	
	print("CM::direction.y ", direction.y)
	print("CM::max_ direction ", max_direction)
	if direction.x > max_direction:
		direction.x = max_direction
	elif direction.x < (max_direction * -1):
		direction.x = max_direction * -1
	if direction.y > max_direction:
		direction.y = max_direction
	elif direction.y < (max_direction * -1):
		direction.y = max_direction * -1
		
	spaceShip.move_and_collide(direction * delta * speed)

func resume_game():
	get_tree().set_pause(false)

func _on_cnfd_quitGame_confirmed():
	get_tree().quit()
	pass
