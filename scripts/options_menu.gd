extends CanvasLayer

var is_paused = false

func _ready():
	# Configura o slider com o volume atual do áudio global
	$Sprite2D/SliderMusica.value = GlobalAudioStreamPlayer.get_volume()

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


func _on_slider_musica_value_changed(value: float) -> void:
	GlobalAudioStreamPlayer.set_volume(value)
	pass # Replace with function body.
