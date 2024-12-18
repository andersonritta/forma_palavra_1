extends CanvasLayer

var is_paused = false

var numVidas = 5
var numDicas = 5

func _ready():
	var slider_vida = get_node("SliderVida")
	var slider_dica = get_node("SliderDica")
	
	if slider_vida:
		slider_vida.value = numVidas
	if slider_dica:
		slider_dica.value = numDicas

func set_num_vidas(value: int) -> void:
	numVidas = value
	#print("Número de Vidas: ", numVidas)

func set_num_dicas(value: int) -> void:
	numDicas = value
	#print("Número de Dicas: ", numDicas)

func get_num_vidas() -> int:
	return numVidas

func get_num_dicas() -> int:
	return numDicas

func show_pause_menu():
	get_tree().paused = true
	visible = true
	is_paused = true
	
func hide_pause_menu():
	get_tree().paused = false
	visible = false
	is_paused = false

func _on_close_pressed() -> void:
	SoundManager.play_click()
	hide_pause_menu()

func _on_slider_vida_value_changed(value: float) -> void:
	ConfigPlayer.set_num_vidas(int(value))  # Atualiza a variável global de vidas

func _on_slider_dica_value_changed(value: float) -> void:
	ConfigPlayer.set_num_dicas(int(value))  # Atualiza a variável global de dicas
