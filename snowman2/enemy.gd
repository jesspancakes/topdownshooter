extends CharacterBody2D

var motion = Vector2()


func _ready():
	pass
	
func _physics_process(_delta):
	var Player = get_parent().get_node("Player")
	
	position += (Player.position - position)/50
	look_at(Player.position)
	
	move_and_collide(motion)


func _on_area_2d_body_entered(body):
	if "Bullet" in body.name:
		print("hello")
		$CPUParticles2D.emitting = true
		$AudioStreamPlayer2D.play()
		queue_free()
