extends Node


func _ready():
	pass

func _process(delta):
	pass

func _on_enemy_spawner_hit_p():
	get_tree().change_scene_to_file("res://game_over_screen.tscn")

#
