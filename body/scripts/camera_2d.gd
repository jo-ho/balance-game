extends Camera2D

func _process(_delta: float) -> void:
	global_position.y = lerp(global_position.y, $"../Ball".global_position.y, 0.1)
