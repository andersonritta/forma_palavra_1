extends CanvasLayer

var is_paused = false

func show_pause_menu():
	visible = true
	is_paused = true
	get_tree().paused = true  # Pausa o jogo, se necessário

func hide_pause_menu():
	visible = false
	is_paused = false
	get_tree().paused = false  # Despausa o jogo, se necessário

func _on_fechar_pressed():
	SoundManager.play_click()
	hide_pause_menu()
