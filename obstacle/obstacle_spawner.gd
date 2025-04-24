class_name ObstacleSpawner
extends Node

@export var max_spawn_delay_secs: float = 3.0
@export var min_spawn_delay_secs: float = 1.0
@export var decrement: float = 0.2
@export var change_every_dist: int = 5000

var curr_dist: int = 0
var spawn_delay_secs: float = max_spawn_delay_secs:
	set(value):
		spawn_delay_secs = clamp(value, min_spawn_delay_secs, max_spawn_delay_secs)

@onready var timer: Timer = $Timer

signal obstacle_spawned(obstacle: RigidBody2D)

var pool: Array[PackedScene] = [
	preload("res://obstacle/weight.tscn"),
]

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = spawn_delay_secs

func _on_timer_timeout() -> void:
	var obstacle: RigidBody2D = pool.pick_random().instantiate()
	obstacle_spawned.emit(obstacle)
	timer.wait_time = spawn_delay_secs
	
func _process(delta: float) -> void:
	if curr_dist > 0 and curr_dist % change_every_dist == 0:
		spawn_delay_secs -= decrement
	
func start() -> void:
	timer.start()

func stop() -> void:
	timer.stop()
