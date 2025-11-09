extends Area2D

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("ball"):
		if body.has_method("request_reset"):
			body.request_reset()
		ScoreManager.reset_score() # Ex: Tira 1000 pontos
