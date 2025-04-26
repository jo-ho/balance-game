extends RigidBody2D

@onready var despawn: Timer = $Despawn
@onready var poof: AnimatedSprite2D = $Poof
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionPolygon2D = $CollisionShape2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sound_delay: Timer = $SoundDelay

func _ready() -> void:
	despawn.timeout.connect(_on_despawn)
	poof.animation_finished.connect(func() -> void: queue_free())
	body_entered.connect(_on_body_entered)

func _on_despawn() -> void:
	freeze = true
	sprite_2d.visible = false
	collision_shape_2d.disabled = true
	
	poof.visible = true
	poof.play("default")
	
func _on_body_entered(_body: Node) -> void:
	if sound_delay.is_stopped():
		audio_stream_player.play()
		sound_delay.start()
