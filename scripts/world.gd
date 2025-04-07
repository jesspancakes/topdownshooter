extends Node2D

@onready var player = $Player

func _ready() -> void:
	player.died.connect(on_player_died)
	
func on_player_died():
	print("game over")
	get_tree().create_timer(3).timeout.connect(get_tree().reload_current_scene)
	
