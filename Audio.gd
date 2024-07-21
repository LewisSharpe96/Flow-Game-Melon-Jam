extends Node

@export var max_volume = -10.0
@export var min_volume = -50.0
@export var volume_multiplier = 0.03

var current_volume = -80.0

var still
var left
var right

func _ready():
	$Wind.playing = true

func _process(delta):
	$Wind.set_volume_db(current_volume)
	
	if Input.is_action_pressed("Left"):
		left = true
		right = false
		still = false
	elif Input.is_action_pressed("Right"):
		right = true
		left = false
		still = false
	else:
		still = true
		left = false
		right = false

func _physics_process(delta):
	if still:
		current_volume = lerp(current_volume, min_volume, 0.008)
	if left:
		current_volume = lerp(current_volume, max_volume, volume_multiplier)
	if right:
		current_volume = lerp(current_volume, max_volume, volume_multiplier)
