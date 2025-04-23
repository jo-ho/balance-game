class_name ObstacleSpawner
extends Node

@export var spawn_delay_secs: float = 3.0

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
	
func start() -> void:
	timer.start()

func stop() -> void:
	timer.stop()
