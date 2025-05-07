extends RigidBody2D

var velocity = Vector2(0, 0)
var speed = 300

func _physics_process(delta):
	var _collision_info = move_and_collide(velocity.normalized() * delta * speed)
	


func _on_body_entered(body: Node) -> void:
	if "Enemy" in body.name:
		body.queue_free()
	queue_free()
