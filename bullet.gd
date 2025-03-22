class_name Bullet extends CharacterBody2D

var is_enemy_bullet := false

func _physics_process(delta: float) -> void:
	var collision := move_and_collide(velocity * delta)
	if collision:
		var collider := collision.get_collider()
		if collider is Bullet and collider.is_enemy_bullet == not is_enemy_bullet:
			collider.queue_free()
			queue_free()
