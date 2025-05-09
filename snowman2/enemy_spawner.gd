extends Node2D

@onready var main = get_node("/root/Main")

signal hit_p

var enemy_scene := preload("res://enemy.tscn")
var spawn_points := []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawn_points.append(i)

func _on_timer_timeout() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	var spawn = spawn_points[randi() % spawn_points.size()]
	var enemy = enemy_scene.instantiate()
	enemy.position = spawn.position
	enemy.hit_player.connect(hit)
	main.add_child(enemy)
	enemy.add_to_group("enemies")


func hit():
	hit_p.emit()
