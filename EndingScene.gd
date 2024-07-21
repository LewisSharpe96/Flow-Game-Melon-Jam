extends Node3D

func _ready():
	$CanvasLayer/AnimationPlayer.play("Fade")

func _on_background_noise_finished():
	$Audio/BackgroundNoise.playing = true
