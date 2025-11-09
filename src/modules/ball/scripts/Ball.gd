extends RigidBody2D

@export var max_speed: float = 3000.0
@export var respawn_coordinates: Vector2 = Vector2(540, 300)

var _teleport_now: bool = false

func _physics_process(delta):
	linear_velocity = linear_velocity.limit_length(max_speed)

func request_reset():
	_teleport_now = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if _teleport_now:
		var t = state.get_transform()
		t.origin = respawn_coordinates
		state.set_transform(t)
		state.set_linear_velocity(Vector2.ZERO)
		state.set_angular_velocity(0.0)
		sleeping = true
		_teleport_now = false
