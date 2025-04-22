class_name Freeze
extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.ball_frozen.emit(true)
	
func _on_expire() -> void:
	Events.ball_frozen.emit(false)
