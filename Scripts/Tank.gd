extends CharacterBody2D

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
	
func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide()
