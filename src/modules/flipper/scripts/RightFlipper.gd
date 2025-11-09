extends AnimatableBody2D

@export var rest_angle: float = deg_to_rad(-30.0)
@export var active_angle: float = deg_to_rad(30.0)
@export var flip_speed: float = 15.0

@export var action_name: String = "flip_right"

var target_rotation: float = 0.0

func _ready():
	rotation = rest_angle
	target_rotation = rest_angle

func _physics_process(delta: float):
	if Input.is_action_pressed(action_name):
		target_rotation = active_angle
	else:
		target_rotation = rest_angle
	
	rotation = move_toward(rotation, target_rotation, flip_speed * delta)
