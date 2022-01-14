extends Area2D

onready var spawn_point : Vector2 = $SpawnPoint.global_position


func _ready():
	$AnimatedSprite.play("no_flag")


func _on_Checkpoint_body_entered(body):
	if body.is_in_group("player"):
		$AnimatedSprite.play("idle")
		CheckPoint.last_position = spawn_point
