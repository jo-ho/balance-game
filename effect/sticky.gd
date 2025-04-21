extends Effect

func _on_apply(duration_secs: float) -> void:
	timer.start(duration_secs)
	Events.bar_stuck.emit(true)
	
func on_expire() -> void:
	queue_free()
	Events.bar_stuck.emit(false)
