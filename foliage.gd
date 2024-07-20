extends Node3D

var scatter_item

@export var max_wind_strength = 0.75
@export var min_wind_strength = -0.75
var original_wind_strength = -0.1
var current_wind_strength

@export var max_wind_speed = 10.0
@export var min_wind_speed = 1.0;
var original_wind_speed = 1.0
var current_wind_speed

var still
var left
var right

# Called when the node enters the scene tree for the first time.
func _ready():
	scatter_item = $ProtonScatter2/ScatterItem
	current_wind_strength = original_wind_strength
	current_wind_speed = original_wind_speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scatter_item.override_material.set("shader_parameter/wind_strength", current_wind_strength)
	scatter_item.override_material.set("shader_parameter/wind_speed", current_wind_speed)
	
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
		current_wind_strength = lerp(current_wind_strength, original_wind_strength, 0.05)
		current_wind_speed = lerp(current_wind_speed, original_wind_speed, 1)
	if left:
		current_wind_strength = lerp(current_wind_strength, min_wind_strength, 0.05)
		current_wind_speed = lerp(current_wind_speed, max_wind_speed, 1)
	if right:
		current_wind_strength = lerp(current_wind_strength, max_wind_strength, 0.05)
		current_wind_speed = lerp(current_wind_speed, max_wind_speed, 1)
