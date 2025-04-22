extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.ball_shrank.emit(true)
	
func _on_expire() -> void:
	Events.ball_shrank.emit(false)
