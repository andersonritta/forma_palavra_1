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
	hide_pause_menu()


func _on_botao_main_menu_pressed():
	hide_pause_menu()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
