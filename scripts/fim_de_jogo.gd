extends Node2D

func _on_play_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_botao_main_menu_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	pass # Replace with function body.
