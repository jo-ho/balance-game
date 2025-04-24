extends Effect

func _on_apply() -> void:
	Events.bar_stuck.emit(true)
	
func _on_expire() -> void:
	Events.bar_stuck.emit(false)
