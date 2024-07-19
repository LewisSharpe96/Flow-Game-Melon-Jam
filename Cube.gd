extends RigidBody3D

@export var float_force := 1.0
@export var water_drag := 0.05
@export var water_angular_drag := 0.05

@export var wind_force := 100;
@export var down_wind_force := 50;

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var water = get_node('/root/Main/Water')

@onready var probes = $ProbeContainer.get_children()

var submerged := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_force(Vector3(0, 0, -down_wind_force))
	
	if Input.is_action_pressed("Left"):
		apply_force(Vector3(wind_force, 0, 0))
	if Input.is_action_pressed("Right"):
		apply_force(Vector3(-wind_force, 0, 0))

func _physics_process(delta):
	submerged = false
	for p in probes:
		var depth = water.get_height(p.global_position) - p.global_position.y 
		if depth > 0:
			submerged = true
			apply_force(Vector3.UP * float_force * gravity * depth, p.global_position - global_position)

func _integrate_forces(state: PhysicsDirectBodyState3D):
	if submerged:
		state.linear_velocity *=  1 - water_drag
		state.angular_velocity *= 1 - water_angular_drag
