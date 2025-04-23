extends Node2D

@onready var player = $Player
@onready var main_camera = $MainCamera

func _ready() -> void:
	player.died.connect(on_player_died)
	player.camera_remote_transform.remote_path = main_camera.get_path()
	
func on_player_died():
	print("game over")
	get_tree().create_timer(3).timeout.connect(get_tree().reload_current_scene)
	
