extends RigidBody2D

var velocity = Vector2(0, 0)
var speed = 300

func _physics_process(delta):
	var _collision_info = move_and_collide(velocity.normalized() * delta * speed)
	


func _on_body_entered(body: Node) -> void:
	if body.name == "OutsideWalls":
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
