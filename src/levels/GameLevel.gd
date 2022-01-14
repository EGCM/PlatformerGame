extends Node2D


func _enter_tree() -> void:
	if Levels.new_level:
		Levels.new_level = false
		return

	if CheckPoint.last_position:
		$Player.global_position = CheckPoint.last_position
