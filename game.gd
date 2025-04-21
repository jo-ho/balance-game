class_name Game
extends Node

@export var pickup_2d_scene: PackedScene
@export var effect_ui_scene: PackedScene

@onready var effect_manager: EffectManager = $EffectManager
@onready var pickup_spawner: PickupSpawner = $PickupSpawner
@onready var pickups: Node = $Pickups
@onready var bar: Bar = $Bar/Bar
@onready var effects: Control = $CanvasLayer/Effects

var dist_traveled: float = 0

func _ready() -> void:
	randomize()
	Events.pickup_collected.connect(_on_pickup_collected)
	pickup_spawner.pickup_spawned.connect(_on_pickup_spawned)
	pickup_spawner.start(bar.position.y)
	effect_manager.new_effect_received.connect(_on_new_effect_received)
	
func _on_pickup_collected(effect_type: EffectData.Type, duration_secs: float) -> void:
	effect_manager.add_effect(effect_type, duration_secs)
	
func _on_pickup_spawned(data: PickupData) -> void:
	var pickup_2d: Pickup2D = pickup_2d_scene.instantiate()
	pickup_2d.data = data
	pickups.add_child(pickup_2d)
	pickup_2d.position = Vector2(
		randi_range(0, get_viewport().size.x), bar.position.y - get_viewport().size.y)

func _process(_delta: float) -> void:
	pickup_spawner.try_spawn(bar.position.y)

func _on_new_effect_received(effect: Effect) -> void:
	var effect_ui: EffectUI = effect_ui_scene.instantiate()
	effect_ui.effect = effect
	effects.add_child(effect_ui)
