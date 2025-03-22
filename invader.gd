class_name Invader extends Area2D

const bullet_scene = preload("res://bullet.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body is Bullet and not body.is_enemy_bullet:
		$/root/Main.invader_count -= 1
		body.queue_free()
		queue_free()


func _on_timer_timeout() -> void:
	var can_fire := randi_range(0, 100) >= 80
	if can_fire:
		var bullet := bullet_scene.instantiate()
		bullet.is_enemy_bullet = true
		bullet.velocity = Vector2(0, 100)
		bullet.global_position = global_position
		$/root/Main.add_child(bullet)
