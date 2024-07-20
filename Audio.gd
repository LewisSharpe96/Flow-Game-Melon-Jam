extends Node

var audio_player_wind

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_player_wind = $Wind


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Left") or Input.is_action_just_pressed("Left"):
		pass
