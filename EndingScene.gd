extends Node3D

func _ready():
	$CanvasLayer/AnimationPlayer.play("Fade")

func _on_background_noise_finished():
	$Audio/BackgroundNoise.playing = true

func _process(delta):
	if Input.is_action_pressed("Esc"):
		get_tree().quit()
