extends "res://Scripts/Tank.gd"

func control(delta):
	$BarrelGun.look_at(get_global_mouse_position())
	
	get_input(delta)
	animate_tracks()

func animate_tracks():
	# Drive Forward
	if Input.is_action_pressed("forward"):
		$TrackLeft.play("drive")
		$TrackRight.play("drive")	
		$TrackLeft/ForwardTrail.emitting = true
		$TrackRight/ForwardTrail.emitting = true
	elif Input.is_action_pressed("reverse"):
		$TrackLeft.play_backwards("drive")
		$TrackRight.play_backwards("drive")	
		$TrackLeft/ReverseTrail.emitting = true
		$TrackRight/ReverseTrail.emitting = true
	# Turn Right
	elif Input.is_action_pressed("turn_right"):
		$TrackLeft.play_backwards("drive")
		$TrackRight.play("drive")
		$TrackLeft/TurnTrail.emitting = true
		$TrackRight/TurnTrail.emitting = true
	# Turn Left
	elif Input.is_action_pressed("turn_left"):
		$TrackLeft.play("drive")
		$TrackRight.play_backwards("drive")
		$TrackLeft/TurnTrail.emitting = true
		$TrackRight/TurnTrail.emitting = true
		
	# Tank Stopped
	if Input.is_action_just_released("forward") || Input.is_action_just_released("turn_left") || Input.is_action_just_released("turn_right") || Input.is_action_just_released("reverse"):
		$TrackLeft.stop()
		$TrackRight.stop()
		$TrackLeft/ForwardTrail.emitting = false
		$TrackRight/ForwardTrail.emitting = false
		$TrackLeft/ReverseTrail.emitting = false
		$TrackRight/ReverseTrail.emitting = false
		$TrackLeft/TurnTrail.emitting = false
		$TrackRight/TurnTrail.emitting = false

func get_input(delta):
	var rotation_direction = 0
	velocity = Vector2.ZERO
	# Turn Right
	if Input.is_action_pressed("turn_right"):
		rotation_direction += 1
	# Turn Left
	if Input.is_action_pressed("turn_left"):
		rotation_direction -= 1
	# Drive Forward
	if Input.is_action_pressed("forward"):
		# position += transform.x * drive_speed * delta
		velocity = Vector2(drive_speed, 0).rotated(rotation)
	# Reverse
	if Input.is_action_pressed("reverse"):
		velocity = Vector2(-reverse_speed, 0).rotated(rotation)
		
	rotation += (rotation_speed / 10) * rotation_direction * delta
