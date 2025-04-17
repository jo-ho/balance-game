class_name PickupSpawner
extends Node

@onready var timer: Timer = $Timer

@export var spawn_delay_secs: float = 1

signal pickup_spawned(pickup: PickupData)

var pool: Array[PickupData] = [
	
]

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.wait_time = spawn_delay_secs

func _on_timer_timeout() -> void:
	var pickup: PickupData = pool.pick_random()
	pickup_spawned.emit(pickup)
	
func start() -> void:
	timer.start()

func stop() -> void:
	timer.stop()
