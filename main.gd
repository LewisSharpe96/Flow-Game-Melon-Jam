extends Node3D

var boat_spawn
var boat
var bottom_area

# Called when the node enters the scene tree for the first time.
func _ready():
	boat_spawn = $BoatSpawn
	boat = $Boat
	bottom_area = $RespawnArea
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if bottom_area.has_overlapping_bodies():
		#print(bottom_area.get_overlapping_bodies())
		#boat.global_position = boat_spawn.global_position
	pass
