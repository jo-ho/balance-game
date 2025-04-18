class_name Ball
extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	Events.ball_frozen.connect(_on_frozen)
	Events.ball_enlarged.connect(_on_ball_enlarged)
	Events.ball_shrank.connect(_on_ball_shrank)
	reset()

func reset() -> void:
	collision_shape_2d.scale = Vector2.ONE * PI
	sprite_2d.scale = Vector2.ONE	

func _on_frozen(value: bool) -> void:
	call_deferred("set_lock_rotation_enabled", value)

func _on_ball_enlarged(value: bool) -> void:
	if value:
		collision_shape_2d.scale = Vector2.ONE * 2 * PI
		sprite_2d.scale = Vector2.ONE * 2
	else:
		reset()
		
func _on_ball_shrank(value: bool) -> void:
	if value:
		collision_shape_2d.scale = Vector2.ONE * (PI / 2.0)
		sprite_2d.scale = Vector2.ONE / 2.0
	else:
		reset()
