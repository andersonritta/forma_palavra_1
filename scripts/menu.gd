extends CanvasLayer

var is_paused = false

func show_pause_menu():
	get_tree().paused = true
	visible = true
	is_paused = true
	
func hide_pause_menu():
	get_tree().paused = false
	visible = false
	is_paused = false


func _on_close_pressed():
	SoundManager.play_click()
	hide_pause_menu()


func _on_botao_main_menu_pressed():
	SoundManager.play_click()
	hide_pause_menu()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_botao_return_pressed() -> void:
	SoundManager.play_click()
	hide_pause_menu()


func _on_botao_reset_pressed() -> void:
	SoundManager.play_click()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	hide_pause_menu()
