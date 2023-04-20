extends Area2D

@export var rotation_speed = 20

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$BarrelGun.rotation = get_global_mouse_position().angle_to_point(position) + deg_to_rad(90)
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("turn_right"):
		$TankBase.rotate(deg_to_rad(rotation_speed/10))
	if Input.is_action_pressed("turn_left"):
		$TankBase.rotate(deg_to_rad(-rotation_speed/10))
