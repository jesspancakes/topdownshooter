extends CharacterBody2D

@onready var player = get_node("/root/Main/Player2")

signal hit_player

var alive : bool
var entered : bool
var speed : int = 100
var direction : Vector2

func _ready():
	var screen_rect = get_viewport_rect()
	alive = true
	entered = false
	var dist = screen_rect.get_center() - position
	
	if abs(dist.x) > abs(dist.y):
		direction.x = dist.x
		direction.y = 0
	else:
		direction.x = 0
		direction.y = dist.y


func _physics_process(_delta):
	if alive:
		if entered:
			direction = (player.position - position)
		direction = direction.normalized()
		velocity = direction * speed
		look_at(player.position)
		move_and_slide()
	else:
		pass

func die():
	alive = false
	$Sprite2D.texture = preload("res://snowman2.png")
	$CPUParticles2D.emitting = true
	$AudioStreamPlayer2D.play()
	$Area2D/CollisionShape2D.set_deferred("disabled", true)

func _on_timer_timeout():
	entered = true

func _on_area_2d_body_entered(_body):
	hit_player.emit()
