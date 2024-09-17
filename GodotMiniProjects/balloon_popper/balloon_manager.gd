class_name BalloonManager extends Node3D


var _score : int = 0
@export var score_text: Label


func _ready() -> void:
	assert(score_text, "score_text is assigned")


func increase_score(amount: int) -> void:
	_score += amount
	score_text.text = str("Score: ", _score)
