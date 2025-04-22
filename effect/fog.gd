extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.fog_enabled.emit(true)
	
func _on_expire() -> void:
	Events.fog_enabled.emit(false)
