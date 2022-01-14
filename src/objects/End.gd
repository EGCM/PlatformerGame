extends Area2D

export (PackedScene) var target_scene


func _ready():
	$AnimationPlayer.play("idle")


func _on_End_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		Levels.new_level = true
		get_tree().change_scene_to(target_scene)
