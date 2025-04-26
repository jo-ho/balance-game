extends Effect

@export var score_value: int = 5000

func on_apply(_duration_secs: float) -> void:
	Globals.score += score_value
