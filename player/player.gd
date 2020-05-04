extends KinematicBody2D

const ACCELERATION = 700
const MAX_SPEED = 80
var speed = MAX_SPEED
const FRICTION = 600
const SPRINT_SPEED = 125

var velocity = Vector2.ZERO
var anim = "idol"
var orbHP = 100
onready var camera = $Camera2D

onready var orb = $"../Orb"
onready var body = $Area2D/body
onready var orbCollision = $"../Orb/CollisionShape2D"
onready var malachi = $malachi
onready var dustCloud = $dustCloud
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var sprite = $Sprite
onready var timer = $Timer
onready var footsteps = $footsteps
onready var music = $music
onready var stepTimer = $stepTimer
onready var death = $"../death"
onready var player = $"."

func _ready():
	pass
	
func _process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
#		animationTree.set("parameters/idle/blend_position", input_vector)
#		animationTree.set("parameters/run/blend_position", input_vector)
#		animationTree.set("parameters/idleHolding/blend_position", input_vector)
#		animationTree.set("parameters/runHolding/blend_position", input_vector)
		
		velocity = velocity.move_toward(input_vector * speed, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	
	velocity = move_and_slide(velocity)	
		
	if Input.is_action_pressed("sprint"):
		speed = SPRINT_SPEED
	else:
		speed = MAX_SPEED
