extends Node2D

# Called when the node enters the scene tree for the first time.
func start(_position):
	position = _position
	$AnimatedSprite2D.play("explosion")

func _on_explosion_finished():
	queue_free()
