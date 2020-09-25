extends KinematicBody2D


export var speed = 4
onready var Bullet = load("res://Bullet.tscn")
var reloaded = true

func _ready():
	pass 

func _process(_delta):
	pass
	
func _physics_process(_delta):
	position += get_input()*speed

	if Input_is_action_pressed("shoot") and reloaded:
		var bullet = Bullet.instance()

func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
	
func _on_Timer_timeout():
	reloaded = true
