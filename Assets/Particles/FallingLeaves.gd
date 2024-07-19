extends GPUParticles3D

@export var wind_force := 25;
@export var down_wind_force := 50;
@export var petal_gravity := -5;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Left"):
		process_material.set("gravity", Vector3(wind_force, petal_gravity, 0))
	if Input.is_action_pressed("Right"):
		process_material.set("gravity", Vector3(-wind_force, petal_gravity, 0))
	if Input.is_action_just_released("Left") or Input.is_action_just_released("Right"):
		process_material.set("gravity", Vector3(0, petal_gravity, 0))
	
	

