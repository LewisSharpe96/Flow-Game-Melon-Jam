extends CanvasLayer

@onready var anim_player = $AnimationPlayer

func _on_start_button_pressed():
	anim_player.play("FadeBlack")

func _on_exit_button_pressed():
	get_tree().quit()

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeBlack":
		get_tree().change_scene_to_file("res://MainBackup.tscn")
