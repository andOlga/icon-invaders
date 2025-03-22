extends Node2D

@onready var invader_count := find_children("Invader*").size()

func _process(delta: float) -> void:
	if invader_count <= 0:
		get_tree().reload_current_scene()
	$Path2D/PathFollow2D.progress_ratio += 0.03 * delta
