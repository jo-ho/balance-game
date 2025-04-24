extends Effect

func _on_apply() -> void:
	Events.fog_enabled.emit(true)
	
func _on_expire() -> void:
	Events.fog_enabled.emit(false)
