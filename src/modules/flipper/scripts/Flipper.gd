extends Node

class_name Flipper

@export var flip_velocity: float = -2000.0
@export var return_velocity: float = 200.0

@onready var hinge = $FlipperPin

func activate_flip():
	hinge.motor_target_velocity = flip_velocity

func release_flip():
	hinge.motor_target_velocity = return_velocity
