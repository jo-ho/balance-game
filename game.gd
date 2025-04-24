class_name Game
extends Node

@export var pickup_2d_scene: PackedScene
@export var effect_ui_scene: PackedScene

@onready var obstacle_spawner: ObstacleSpawner = $ObstacleSpawner
@onready var effect_manager: EffectManager = $EffectManager
@onready var pickup_spawner: PickupSpawner = $PickupSpawner
@onready var pickups: Node = $Pickups
@onready var bar: Bar = $Bar/Bar
@onready var effects: Control = $UI/Effects
@onready var fog: Sprite2D = $WorldEffects/Fog
@onready var killzone: Killzone = $Bar/Bar/Killzone
@onready var ball: Ball = $Ball
@onready var obstacles: Node = $Obstacles
@onready var distance: Label = $UI/Distance

var starting_dist: float = 0

func _ready() -> void:
	randomize()
	Events.pickup_collected.connect(_on_pickup_collected)
	Events.fog_enabled.connect(_on_fog_enabled)
	
	pickup_spawner.pickup_spawned.connect(_on_pickup_spawned)
	pickup_spawner.start(bar.position.y)
	
	obstacle_spawner.obstacle_spawned.connect(_on_obstacle_spawned)
	obstacle_spawner.start()
	
	effect_manager.new_effect_received.connect(_on_new_effect_received)
	killzone.ball_revived.connect(_on_ball_revived)
	
	starting_dist = bar.position.y
	
func _on_pickup_collected(effect_type: EffectData.Type, duration_secs: float) -> void:
	effect_manager.add_effect(effect_type, duration_secs)
	
func _on_pickup_spawned(data: PickupData) -> void:
	var pickup_2d: Pickup2D = pickup_2d_scene.instantiate()
	pickup_2d.data = data
	pickups.add_child(pickup_2d)
	pickup_2d.position = Vector2(
		randi_range(0, get_viewport().size.x), bar.position.y - get_viewport().size.y)
		
func _on_obstacle_spawned(obstacle: RigidBody2D) -> void:
	obstacles.add_child(obstacle)
	obstacle.position = Vector2(
		randi_range(0, get_viewport().size.x), bar.position.y - get_viewport().size.y)
	obstacle.rotation = randf_range(0, 2 * PI)

func _process(_delta: float) -> void:
	var dist_traveled: int = absi(bar.position.y - starting_dist)
	distance.text = str(dist_traveled)
	pickup_spawner.try_spawn(bar.position.y)
	
	pickup_spawner.curr_dist = dist_traveled
	obstacle_spawner.curr_dist = dist_traveled

func _on_new_effect_received(effect: Effect) -> void:
	var effect_ui: EffectUI = effect_ui_scene.instantiate()
	effect_ui.effect = effect
	effects.add_child(effect_ui)
	
func _on_fog_enabled(value: bool) -> void:
	fog.visible = value
	
func _on_ball_revived() -> void:
	PhysicsServer2D.body_set_state(
		  ball.get_rid(),
		  PhysicsServer2D.BodyState.BODY_STATE_TRANSFORM,
		  Transform2D.IDENTITY.translated(bar.position - Vector2(0, 256))
	)
