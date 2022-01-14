extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("trigger")


func _on_SpikeTrap_body_entered(body) -> void:
	if body.is_in_group("player"):
		LoseSFX.play()
		get_tree().reload_current_scene()
