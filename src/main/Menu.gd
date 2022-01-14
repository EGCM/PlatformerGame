extends Control

export (PackedScene) var target_scene

onready var menu_blip = $MenuBlip
onready var menu_clicked = $MenuClicked


func _on_StartButton_pressed() -> void:
	menu_clicked.play()
	Bgm.play()
	get_tree().change_scene_to(target_scene)


func _on_QuitButton_pressed() -> void:
	get_tree().quit()


func _on_StartButton_mouse_entered() -> void:
	menu_blip.play()


func _on_QuitButton_mouse_entered() -> void:
	menu_blip.play()
