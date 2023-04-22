extends CharacterBody2D

signal shot
signal health_changed
signal destroyed

@export var Bullet: PackedScene
@export var rotation_speed: float
@export var drive_speed: float
@export var reverse_speed: float
@export var health: int
@export var reload_speed: float
@export var attack_damage: int

# var velocity = Vector2.ZERO
var can_shoot = true
var alive = true

func _ready():
	$Reload.wait_time = reload_speed

func control(delta):
	pass
	
func shoot():
	if can_shoot:
		can_shoot = false
		$Reload.start()
		var barrel_direction = Vector2(1,0).rotated($BarrelGun.global_rotation)
		emit_signal("shot", Bullet, $BarrelGun/Muzzle.global_position, barrel_direction)

func _on_reload_timeout():
	can_shoot = true

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide()
