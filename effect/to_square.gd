extends Effect

func _on_apply() -> void:
	Events.ball_shaped_changed.emit(Ball.Shape.SQUARE)
	
func _on_expire() -> void:
	Events.ball_shaped_changed.emit(Ball.Shape.CIRCLE)
