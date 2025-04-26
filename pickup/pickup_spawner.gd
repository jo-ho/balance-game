class_name PickupSpawner
extends Node

@export var max_spawn_distance: int = 1000
@export var min_spawn_distance: int = 250
@export var decrement: int = 50
@export var change_every_dist: int = 2500

var curr_dist: int = 0

var curr_spawn_dist: int = max_spawn_distance:
	set(value):
		curr_spawn_dist = clamp(value, min_spawn_distance, max_spawn_distance)

signal pickup_spawned(pickup: PickupData)

@export var pool: Array[PickupData] = []

var last_spawned_y: float = 0
var stopped: bool = true

func try_spawn(current_y: float) -> void:
	if curr_dist > 0 and curr_dist % change_every_dist == 0:
		curr_spawn_dist -= decrement
		
	if not stopped and int(current_y - last_spawned_y) <= -curr_spawn_dist:
		var pickup: PickupData = pool.pick_random()
		pickup_spawned.emit(pickup)
		last_spawned_y = current_y
	
func start(current_y: float) -> void:
	last_spawned_y = current_y
	stopped = false

func stop() -> void:
	stopped = true
