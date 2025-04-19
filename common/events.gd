extends Node

signal pickup_collected(effect_type: EffectData.Type, duration_secs: float)
signal ball_frozen(value: bool)
signal ball_enlarged(value: bool)
signal ball_shrank(value: bool)
signal ball_shaped_changed(value: Ball.Shape)
