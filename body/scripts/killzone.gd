class_name Killzone
extends Area2D

@onready var timer: Timer = $Timer

signal ball_revived

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	if body is not Ball:
		return
	print("You Died")
	if not Globals.revive_active:
		timer.start()
		audio_stream_player.play()
	else:
		ball_revived.emit()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
