extends RigidBody2D

@onready var despawn: Timer = $Despawn

func _ready() -> void:
	despawn.timeout.connect(func() -> void: queue_free())
