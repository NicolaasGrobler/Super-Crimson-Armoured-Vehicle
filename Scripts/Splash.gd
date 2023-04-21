extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/AnimationPlayer.play("Fade In")
	await get_tree().create_timer(6).timeout

func _on_audio_stream_player_2d_finished():
	$CanvasLayer/AnimationPlayer.play("Fade Out")
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://Scenes/BattleGround.tscn")
