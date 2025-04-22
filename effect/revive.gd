extends Effect

func _on_apply(duration_secs: float) -> void:
	Globals.revive_active = true
	
func on_expire() -> void:
	Globals.revive_active = false
