extends Node3D

var boat_spawn
var boat

# Called when the node enters the scene tree for the first time.
func _ready():
	boat_spawn = $BoatSpawn
	boat = $Boat

func _on_game_end_body_entered(body):
	print("You Win")
	pass # Replace with function body.
