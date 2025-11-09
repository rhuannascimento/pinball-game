extends Label

func _ready():
	ScoreManager.score_updated.connect(_on_score_updated)
	
	text = "Score: 0"

func _on_score_updated(new_score: int):
	text = "Score: " + str(new_score)
