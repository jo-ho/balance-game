extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.ball_shaped_changed.emit(Ball.Shape.SQUARE)
	
func _on_expire() -> void:
	Events.ball_shaped_changed.emit(Ball.Shape.CIRCLE)
