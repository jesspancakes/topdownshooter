extends Area2D

var speed : int = 500
var direction : Vector2

func _process(delta):
	position += speed * direction * delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body):
		if body.alive:
			body.die()
			queue_free()
