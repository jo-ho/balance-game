extends Effect

func on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.ball_shaped_changed.emit(Ball.Shape.SQUARE)
	
func on_expire() -> void:
	Events.ball_shaped_changed.emit(Ball.Shape.CIRCLE)
	queue_free()
