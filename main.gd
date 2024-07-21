extends Node3D

var boat_spawn
var boat
var original_boat_position

# Called when the node enters the scene tree for the first time.
func _ready():
	boat_spawn = $BoatSpawn
	boat = $Boat
	original_boat_position = boat.global_position
	
func _process(delta):
	
	pass

func _on_game_end_body_entered(body):
	print("You Win")
	pass # Replace with function body.
