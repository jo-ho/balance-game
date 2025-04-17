class_name Freeze
extends Effect

func on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.ball_frozen.emit(true)
	
func on_expire() -> void:
	Events.ball_frozen.emit(false)
	queue_free()
