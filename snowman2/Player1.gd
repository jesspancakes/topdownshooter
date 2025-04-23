extends CharacterBody2D

const bulletPath = preload("res://Bullet.tscn")


func _ready():
	pass
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
	$Node2D.look_at(get_global_mouse_position())
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	



func shoot():
	var bullet = bulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position
