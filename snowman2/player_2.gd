extends CharacterBody2D

signal shoot

@onready var main_camera = $Camera2D
@onready var player = $"."


var speed : int
var can_shoot : bool
var screen_size : Vector2

func _ready():
	speed = 400
	can_shoot = true
	
func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir = get_global_mouse_position() - position
		shoot.emit(position, dir)
		can_shoot = false
		$ShotTimer.start()
	
func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	
func on_player_died():
	print("game over")
	get_tree().create_timer(3).timeout.connect(get_tree().reload_current_scene)


func _on_shot_timer_timeout():
	can_shoot = true
