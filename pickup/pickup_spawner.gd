class_name PickupSpawner
extends Node

@onready var timer: Timer = $Timer

@export var spawn_delay_secs: float = 1

signal pickup_spawned(pickup: Pickup)

var pool: Array[Pickup] = [
	
]

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = spawn_delay_secs

func _on_timer_timeout() -> void:
	var pickup: Pickup = pool.pick_random().instantiate()
	pickup_spawned.emit(pickup)
	
func start() -> void:
	timer.start()

func stop() -> void:
	timer.stop()
