extends Effect

func _on_apply(duration_secs: float) -> void:
	Events.bar_stuck.emit(true)
	
func _on_expire() -> void:
	Events.bar_stuck.emit(false)
