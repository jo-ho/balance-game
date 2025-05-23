class_name Ball
extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

enum Shape {
	CIRCLE,
	SQUARE,
}

var textures: Dictionary[Shape, Texture2D] = {
	Shape.CIRCLE: preload("res://body/assets/circle.png"),
	Shape.SQUARE: preload("res://body/assets/square.png"),
}

var shapes: Dictionary[Shape, Shape2D] = {
	Shape.CIRCLE: CircleShape2D.new(),
	Shape.SQUARE: RectangleShape2D.new(),
}


func _ready() -> void:
	Events.ball_frozen.connect(_on_frozen)
	Events.ball_enlarged.connect(_on_ball_enlarged)
	Events.ball_shrank.connect(_on_ball_shrank)
	Events.ball_shaped_changed.connect(_on_ball_shape_changed)
	reset()

func reset_scale() -> void:
	collision_shape_2d.scale = Vector2.ONE * PI
	sprite_2d.scale = Vector2.ONE
	
func reset_shape() -> void:
	collision_shape_2d.shape = shapes[Shape.CIRCLE]
	sprite_2d.texture = textures[Shape.CIRCLE]

func reset() -> void:
	reset_scale()
	reset_shape()

func _on_frozen(value: bool) -> void:
	call_deferred("set_lock_rotation_enabled", value)

func _on_ball_enlarged(value: bool) -> void:
	if value:
		collision_shape_2d.scale = Vector2.ONE * 2 * PI
		sprite_2d.scale = Vector2.ONE * 2
	else:
		reset_scale()
		
func _on_ball_shrank(value: bool) -> void:
	if value:
		collision_shape_2d.scale = Vector2.ONE * (PI / 2.0)
		sprite_2d.scale = Vector2.ONE / 2.0
	else:
		reset_scale()
		
func _on_ball_shape_changed(shape: Shape) -> void:
	collision_shape_2d.call_deferred("set_shape", shapes[shape])
	sprite_2d.texture = textures[shape]
