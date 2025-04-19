class_name Bar
extends AnimatableBody2D

const BASE_VELOCITY = 1
const BASE_MOVE_VELOCTY = 300
const ROTATION_LIMIT = PI / 9

var rotate_velocity: int = 0
var move_velocity: int = 0

var stuck_status: Array[float] = [1.0, 1.0]

func _ready() -> void:
	Events.bar_stuck.connect(_on_bar_stuck)

func _physics_process(delta: float) -> void:
	var left_axis: float = Input.get_axis("left_down", "left_up") * stuck_status[0]
	var right_axis: float = Input.get_axis("right_down", "right_up") * stuck_status[1]
	if is_zero_approx(right_axis) && is_zero_approx(left_axis):
		move_velocity = 0
		rotate_velocity = 0
	elif is_zero_approx(right_axis):
		rotate_velocity = left_axis * BASE_VELOCITY
		move_velocity = left_axis * -BASE_MOVE_VELOCTY
	elif is_zero_approx(left_axis):
		rotate_velocity = right_axis * -BASE_VELOCITY
		move_velocity = right_axis * -BASE_MOVE_VELOCTY
	elif is_equal_approx(right_axis, left_axis):
		move_velocity = right_axis * -BASE_MOVE_VELOCTY
		rotate_velocity = 0
		
	rotation = clamp(rotation + delta * rotate_velocity, -ROTATION_LIMIT, ROTATION_LIMIT) 
	move_and_collide(Vector2(0, delta * move_velocity))

func _on_bar_stuck(value: bool) -> void:
	if value:
		stuck_status = [1.0, 0]
		stuck_status.shuffle()
	else:
		stuck_status = [1.0, 1.0]
	
