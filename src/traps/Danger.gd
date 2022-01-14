extends Area2D


func _on_Danger_body_entered(body) -> void:
	if body.is_in_group("player"):
		LoseSFX.play()
		get_tree().reload_current_scene()
