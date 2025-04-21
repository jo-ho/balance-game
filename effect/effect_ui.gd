class_name EffectUI
extends HBoxContainer

@onready var texture_rect: TextureRect = $TextureRect
@onready var progress_bar: ProgressBar = $ProgressBar

var effect: Effect

func _ready() -> void:
	effect.timer.timeout.connect(func() -> void: queue_free())
	effect.applied.connect(_on_effect_applied)
	_on_effect_applied(effect.timer.wait_time)
	texture_rect.texture = effect.data.sprite
	
func _process(_delta: float) -> void:
	progress_bar.value = effect.timer.time_left
	
func _on_effect_applied(value: float) -> void:
	progress_bar.max_value = value
