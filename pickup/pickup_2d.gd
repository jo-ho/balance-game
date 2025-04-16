class_name Pickup2D
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var despawn: Timer = $Despawn
@onready var effect_timer: Timer = $EffectTimer

var data: Pickup
var remaining_time_ms: int

func _ready() -> void:
	area_2d.body_entered.connect(_on_body_entered)
	despawn.timeout.connect(func() -> void: queue_free())
	
	effect_timer.wait_time = data.duration_ms
	effect_timer.timeout.connect(_on_effect_timeout)
	
func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		_on_effect_start()

func _on_effect_start() -> void:
	pass
	
func _on_effect_timeout() -> void:
	pass
