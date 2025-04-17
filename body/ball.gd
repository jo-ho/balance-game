class_name Ball
extends RigidBody2D

func _ready() -> void:
	Events.ball_frozen.connect(_on_frozen)

func _on_frozen(value: bool) -> void:
	call_deferred("set_lock_rotation_enabled", value)
