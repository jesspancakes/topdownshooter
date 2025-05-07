extends Node

var friends : int
var max_enemies : int

func _ready():
	max_enemies = 10
	friends = 0
	$Player2/HUD/Friends.text = "Friends : " + str(friends)
	
func _process(delta):
	if is_wave_completed():
		get_tree().change_scene_to_file("res://win.tscn")

func _on_enemy_spawner_hit_p():
	get_tree().change_scene_to_file("res://game_over_screen.tscn")

func is_wave_completed():
	var all_dead = true
	var enemies = get_tree().get_first_node_in_group("enemies")
	if enemies.size() == max_enemies:
		for e in enemies:
			if e.alive:
				all_dead = false
		return all_dead
	else:
		return false
