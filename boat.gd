extends RigidBody3D

@export var float_force := 1.0
@export var water_drag := 0.05
@export var water_angular_drag := 0.05

@export var wind_force := 100;
@export var down_wind_force := 100;

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var water = get_node('/root/Main/Water')

@onready var anim_player = $"../CanvasLayer/AnimationPlayer"

@onready var probes = $ProbeContainer.get_children()

@onready var boat_collision_area = $Area3D


@export var boat_spawn = Marker3D

var died = false

var submerged := false

# Called when the node enters the scene tree for the first time.
func _ready():
	died = false
	anim_player.play("Fade")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if died == false:
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


func _on_area_3d_body_entered(body):
	anim_player.play("Fade",-1.0,-1.0,true)
	print("Died")
	died = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Fade" && died == true:
		get_tree().change_scene_to_file("res://MainBackup.tscn")
