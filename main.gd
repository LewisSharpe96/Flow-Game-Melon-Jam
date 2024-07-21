extends Node3D

var boat_spawn
var boat
var original_boat_position
var end = false

@onready var anim_player = $CanvasLayer/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	end = false
	boat_spawn = $BoatSpawn
	boat = $Boat
	original_boat_position = boat.global_position
	
func _process(delta):
	if Input.is_action_pressed("Esc"):
		get_tree().quit()

func _on_area_3d_body_entered(body):
	pass
	
func _on_end_area_body_entered(body):
	anim_player.play("Fade")
	print("end")
	end = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Fade" && end:
		get_tree().change_scene_to_file("res://EndingScene.tscn")



