extends Effect

func on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.ball_shrank.emit(true)
	
func on_expire() -> void:
	Events.ball_shrank.emit(false)
	queue_free()
