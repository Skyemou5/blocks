extends KinematicBody2D

var dir : Vector2 = Vector2()

# define directions
const TOP : Vector2 = Vector2(0,-1)
const RIGHT : Vector2 = Vector2(-1,0)
const DOWN : Vector2 = Vector2(0,1)
const LEFT : Vector2 = Vector2(-2,0)

const MAX_SPEED = 400

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var is_moving : bool = Input.is_action_pressed("move_up") or Input.is_action_pressed("move_down") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_up")
	
	if is_moving:
		speed = MAX_SPEED
		if Input.is_action_pressed("move_up"):
			direction = TOP
		elif Input.is_action_pressed("move_right"):
			direction = RIGHT
		elif Input.is_action_pressed("move_down"):
			direction = DOWN
		elif Input.is_action_pressed("move_left"):
			direction = LEFT
	else:
		speed = 0
	
	velocity = speed * dir * delta

	move(velocity)
