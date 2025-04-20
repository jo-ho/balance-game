class_name PickupSpawner
extends Node

@export var spawn_distance: int = 1000

signal pickup_spawned(pickup: PickupData)

@export var pool: Array[PickupData] = []

var last_spawned_y: float = 0
var stopped: bool = true

func try_spawn(current_y: float) -> void:
	if not stopped and int(current_y - last_spawned_y) <= -spawn_distance:
		var pickup: PickupData = pool.pick_random()
		pickup_spawned.emit(pickup)
		last_spawned_y = current_y
	
func start(current_y: float) -> void:
	last_spawned_y = current_y
	stopped = false

func stop() -> void:
	stopped = true
