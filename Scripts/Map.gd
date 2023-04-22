extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_camera_limits()

func set_camera_limits():
	var map_limits = $Terrain.get_used_rect()
	var map_cellsize = $Terrain.tile_set.tile_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _on_tank_shot(bullet, _position, _direction):
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
	bullet_instance.start(_position, _direction)
