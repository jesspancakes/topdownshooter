extends CharacterBody2D

var speed = 500
var bullet_speed = 600
var bullet = preload("res://Bullet.tscn")

func _ready():
	pass

func _physics_process(delta: float) -> void:
	var move_dir = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	
	if move_dir != Vector2.ZERO:
		velocity = speed * move_dir.normalized()
	else: 
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)
	
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("shoot"):
		fire()
	
func fire():
	var bullet_instantiate = bullet.instantiate()
	bullet_instantiate.position = get_global_position()
	bullet_instantiate.rotation_degrees = rotation_degrees
	bullet_instantiate.linear_velocity = Vector2(bullet_speed,0).rotated(rotation)
	get_tree().get_root().call_deferred("add_child", bullet_instantiate)
	
	
func _kill():
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body):
	if "Enemy" in body.name:
		_kill()
