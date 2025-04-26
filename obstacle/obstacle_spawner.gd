class_name ObstacleSpawner
extends Node

@export var max_spawn_delay_secs: float = 1.5
@export var min_spawn_delay_secs: float = 0.3
@export var decrement: float = 0.1
@export var change_every_dist: int = 5000

var curr_dist: int = 0
var spawn_delay_secs: float = max_spawn_delay_secs:
	set(value):
		spawn_delay_secs = clamp(value, min_spawn_delay_secs, max_spawn_delay_secs)

@onready var timer: Timer = $Timer

signal obstacle_spawned(obstacle: RigidBody2D)

var pool: Array[PackedScene] = [
	preload("res://obstacle/weight.tscn"),
	preload("res://obstacle/carrot.tscn"),
	preload("res://obstacle/mobius.tscn"),
	preload("res://obstacle/basketball.tscn"),
	preload("res://obstacle/crate.tscn"),
	preload("res://obstacle/shuriken.tscn"),
]

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = spawn_delay_secs

func _on_timer_timeout() -> void:
	var obstacle: RigidBody2D = pool.pick_random().instantiate()
	obstacle_spawned.emit(obstacle)
	timer.wait_time = spawn_delay_secs
	
func _process(_delta: float) -> void:
	if curr_dist > 0 and curr_dist % change_every_dist == 0:
		spawn_delay_secs -= decrement
	
func start() -> void:
	timer.start()

func stop() -> void:
	timer.stop()
