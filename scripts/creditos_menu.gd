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


func _on_close_pressed() -> void:
	hide_pause_menu()
