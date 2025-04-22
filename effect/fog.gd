extends Effect

func _on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.fog_enabled.emit(true)
	
func on_expire() -> void:
	Events.fog_enabled.emit(false)
	queue_free()
