extends CharacterBody2D

const bulletPath = preload("res://Bullet.tscn")

var speed = 300

func _ready():
	pass
	


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
		
	$Node2D.look_at(get_global_mouse_position())
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
func _physics_process(delta: float) -> void:
	var move_dir = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	
	if move_dir != Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	
	move_and_slide()




func shoot():
	var bullet = bulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Node2D/Marker2D.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position
	
