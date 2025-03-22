class_name Player extends Area2D

const bullet_scene := preload("res://bullet.tscn")
var lives := 3

func _process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	direction.y = 0
	position += direction * 3 * 60 * delta
	if position.x <= 10:
		position.x = 10
	if position.x >= 640-64:
		position.x = 640-64
	if Input.is_action_just_pressed("action_fire"):
		var bullet := bullet_scene.instantiate()
		bullet.velocity = Vector2(0, -500)
		bullet.global_position = global_position + Vector2(32, -32)
		$/root/Main.add_child(bullet)
		

func _on_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	if area is Invader:
		hurt()

func _on_body_entered(body: Node2D) -> void:
	if body is Bullet and body.is_enemy_bullet:
		body.queue_free()
		hurt()

func hurt() -> void:
	lives -= 1
	if lives < 0:
		get_tree().reload_current_scene()
