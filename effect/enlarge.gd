class_name Enlarge
extends Effect

func _on_apply() -> void:
	Events.ball_enlarged.emit(true)
	
func _on_expire() -> void:
	Events.ball_enlarged.emit(false)
