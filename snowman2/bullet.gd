extends RigidBody2D

var speed = 300  





func _on_body_entered(body: Node) -> void:
	if body.alive:
			body.die()
			queue_free()
