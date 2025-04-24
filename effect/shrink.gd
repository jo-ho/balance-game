extends Effect

func _on_apply() -> void:
	Events.ball_shrank.emit(true)
	
func _on_expire() -> void:
	Events.ball_shrank.emit(false)
