extends Area2D

signal exploded

@export var speed: float
@export var damage: int
@export var lifetime: float

var velocity = Vector2.ZERO

func start(_position, _direction):
	position = _position
	rotation = _direction.angle()
	$Lifetime.wait_time = lifetime
	velocity = _direction * (speed * 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta

func explode():
	velocity = Vector2.ZERO
	$Sprite2D.hide()
	$Explosion.show()
	$Explosion.play("explosion")
	$FireParticles.emitting = true
	$FireLifetime.start()

func _on_lifetime_timeout():
	explode()

func _on_body_entered(body):
	explode()
	if body.has_method('take_damage'):
		body.take_damage(damage)

func _on_fire_lifetime_timeout():
	queue_free()

func _on_explosion_animation_finished():
	print('Explosion finished')
	$Explosion.stop()
	$Explosion.hide()
