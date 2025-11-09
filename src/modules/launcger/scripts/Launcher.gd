extends AnimatableBody2D

@export var rest_position_y: float = 0.0
@export var pulled_position_y: float = 200.0

@export var pull_speed: float = 150.0
@export var launch_speed: float = 2000.0

@export var action_name: String = "launch_ball"

var target_y: float = 0.0

func _ready():
	position.y = rest_position_y
	target_y = rest_position_y

func _physics_process(delta: float):
	var current_speed = 0.0
	
	if Input.is_action_pressed(action_name):
		target_y = pulled_position_y
		current_speed = pull_speed
	else:
		target_y = rest_position_y
		current_speed = launch_speed
	
	position.y = move_toward(position.y, target_y, current_speed * delta)
