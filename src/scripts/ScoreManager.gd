extends Node

signal add_points(amount)
signal score_updated(new_score)

var current_score: int = 0

func _ready():
	add_points.connect(_on_add_points)

func _on_add_points(amount: int):
	current_score += amount
	score_updated.emit(current_score)
	print("Pontuação atual: ", current_score) 

func reset_score():
	current_score = 0
	score_updated.emit(current_score)
