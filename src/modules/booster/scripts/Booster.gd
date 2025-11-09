extends Area2D

@export var boost_speed: float = 1500.0

func _on_body_entered(body):
	if body.is_in_group("ball"):
		var direction = Vector2.UP.rotated(rotation)
		body.linear_velocity = direction * boost_speed
