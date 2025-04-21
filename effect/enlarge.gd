class_name Enlarge
extends Effect

func _on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.ball_enlarged.emit(true)
	
func on_expire() -> void:
	Events.ball_enlarged.emit(false)
	queue_free()
