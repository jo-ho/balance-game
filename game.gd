class_name Game
extends Node

@onready var effect_manager: EffectManager = $EffectManager

func _ready() -> void:
	Events.pickup_collected.connect(_on_pickup_collected)
	
func _on_pickup_collected(effect_type: EffectData.Type, duration_secs: float) -> void:
	effect_manager.add_effect(effect_type, duration_secs)
	
