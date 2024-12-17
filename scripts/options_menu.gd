extends CanvasLayer

var is_paused = false

func _ready():
	# Configura o slider com o volume atual do áudio global
	$Sprite2D/SliderMusica.value = GlobalAudioStreamPlayer.get_volume()
	$Sprite2D/SliderEfeito.value = SoundManager.volume_efeitos

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
	SoundManager.play_click()


func _on_slider_musica_value_changed(value: float) -> void:
	GlobalAudioStreamPlayer.set_volume(value)
	pass # Replace with function body.


func _on_slider_efeito_value_changed(value: float) -> void:
	SoundManager.set_volume_efeitos(value)
	pass # Replace with function body.

func reset_sliders():
	$Sprite2D/SliderMusica.value = 0.5  # Valor padrão para música
	$Sprite2D/SliderEfeito.value = 0.5  # Valor padrão para efeitos
	GlobalAudioStreamPlayer.set_volume(0.5)
	SoundManager.set_volume_efeitos(0.5)
