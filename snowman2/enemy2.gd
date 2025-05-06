extends CharacterBody2D

@onready var main = get_node("/root/World")
@onready var player = get_node("/root/World/Player")


signal hit_player

var alive : bool
var entered : bool
var speed : int = 100
var direction : Vector2

func _ready():
	var screen_rect = get_viewport_rect()
	alive = true
	entered = false
	#pick a direction for the entrance
	var dist = screen_rect.get_center() - position
	#check if need to move horizontally or vertically
	if abs(dist.x) > abs(dist.y):
		#move horizontally
		direction.x = dist.x
		direction.y = 0
	else:
		#move vertically
		direction.x = 0
		direction.y = dist.y

func _physics_process(_delta):
	if alive:
		direction = (player.position - position)
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		pass
		

func die():
	print("hello")
	$Sprite2D.texture = preload("res://snowman2.png")
	set_physics_process(false)
	$CPUParticles2D.emitting = true
	$AudioStreamPlayer2D.play()
	
