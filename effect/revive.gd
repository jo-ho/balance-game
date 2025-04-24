extends Effect

func _on_apply() -> void:
	Globals.revive_active = true
	
func on_expire() -> void:
	Globals.revive_active = false
