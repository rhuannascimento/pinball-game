extends Area2D

@export var points_value: int = 100

@onready var collision_shape: CollisionPolygon2D = $CollisionPolygon2D

@export var cooldown_duration: float = 0.5 

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if not collision_shape.is_disabled() and body.is_in_group("ball"):
		ScoreManager.add_points.emit(points_value)
		
		collision_shape.set_deferred("disabled", true)
		
		get_tree().create_timer(cooldown_duration).timeout.connect(_on_cooldown_finished)

func _on_cooldown_finished():
	collision_shape.set_deferred("disabled", false)
