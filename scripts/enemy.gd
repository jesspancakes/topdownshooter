extends CharacterBody2D
class_name Enemy

var player: Player = null 

var speed: float = 100
var direction := Vector2.ZERO

func _process(delta: float) -> void:
	if player != null:
		look_at(player.global_position)

func _physics_process(delta: float) -> void:
	if player != null:
		var enemy_to_player = (player.global_position - global_position)
		direction = enemy_to_player.normalized()
		
		if direction != Vector2.ZERO:
			velocity = speed * direction.normalized()
		else: 
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)
		
		
		move_and_slide()

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
			print(name + "found the player")


func _on_player_detector_body_exited(body: Node2D) -> void:
	if body is Player:
		if player != null:
			player = null
			print(name + "lost the player")
