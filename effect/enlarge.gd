class_name Enlarge
extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.ball_enlarged.emit(true)
	
func _on_expire() -> void:
	Events.ball_enlarged.emit(false)
