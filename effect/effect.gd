class_name Effect
extends Node

@onready var timer: Timer = $Timer

signal applied(value: float)

var data: EffectData

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)

func on_apply(_duration_secs: float) -> void:
	applied.emit(_duration_secs)
	_on_apply(_duration_secs)
	
func _on_apply(_duration_secs: float) -> void:
	pass
	
func on_expire() -> void:
	pass

func _on_timer_timeout() -> void:
	on_expire()
