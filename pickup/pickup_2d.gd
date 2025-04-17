class_name Pickup2D
extends Node2D

@onready var area_2d: Area2D = $Area2D
@onready var despawn: Timer = $Despawn
@onready var sprite: Sprite2D = $Sprite2D

@export var data: PickupData:
	set(value):
		data = value

func _ready() -> void:
	area_2d.body_entered.connect(_on_body_entered)
	despawn.timeout.connect(func() -> void: queue_free())
	sprite.texture = data.sprite
	
func _on_body_entered(body: Node2D) -> void:
	if body is Ball:
		Events.pickup_collected.emit(data.effect_type, data.duration_secs)
		queue_free()
