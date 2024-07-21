extends GPUParticles3D

@export var wind_force_multiplier := 5;
@export var max_wind_force := 2;
var current_wind_force := 2;

@export var down_wind_force := 0
@export var petal_gravity := 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Left"):
		process_material.set("gravity", Vector3(current_wind_force, petal_gravity, -down_wind_force))
	if Input.is_action_pressed("Right"):
		process_material.set("gravity", Vector3(-current_wind_force, petal_gravity, -down_wind_force))
	if Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		process_material.set("gravity", Vector3(0, petal_gravity, -down_wind_force))
	

