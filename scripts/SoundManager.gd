extends Node

const SOM_ACERTO = preload("res://assets/Audio/right-answer-buzzer.mp3")
const SOM_ERRO = preload("res://assets/Audio/wrong-answer-buzzer.mp3")
const SOM_CLICK = preload("res://assets/Audio/click.mp3")
const SOM_DROPLETTER = preload("res://assets/Audio/dropLetter.mp3")
const FASE_CORRETA = preload("res://assets/Audio/right-answer-buzzer.mp3")
const FASE_ERRADA = preload("res://assets/Audio/wrong-answer-buzzer.mp3")

var sound_acerto: AudioStreamPlayer
var sound_erro: AudioStreamPlayer
var sound_click: AudioStreamPlayer  
var sound_dropLetter: AudioStreamPlayer
var sound_fase_correta: AudioStreamPlayer
var sound_fase_errada: AudioStreamPlayer

var volume_efeitos = 1.0  # Volume inicial (linear 0.0 a 1.0)
var is_muted = false

# Inicialização
func _ready():
	# Inicializa os players
	sound_acerto = AudioStreamPlayer.new()
	sound_erro = AudioStreamPlayer.new()
	sound_click = AudioStreamPlayer.new()
	sound_dropLetter = AudioStreamPlayer.new()
	sound_fase_correta = AudioStreamPlayer.new()
	sound_fase_errada = AudioStreamPlayer.new()
	
	if sound_acerto == null or sound_erro == null or sound_click == null or sound_dropLetter == null or sound_fase_correta == null or sound_fase_errada == null:
		print("Erro: AudioStreamPlayers não foram criados corretamente.")
	
	sound_acerto.stream = SOM_ACERTO
	sound_erro.stream = SOM_ERRO
	sound_click.stream = SOM_CLICK 
	sound_dropLetter.stream = SOM_DROPLETTER
	sound_fase_correta.stream = FASE_CORRETA
	sound_fase_errada.stream = FASE_ERRADA	

	add_child(sound_acerto)
	add_child(sound_erro)
	add_child(sound_click)  
	add_child(sound_dropLetter)
	add_child(sound_fase_correta)
	add_child(sound_fase_errada)	

	# Define volume inicial
	set_volume_efeitos(volume_efeitos)

# Função para tocar som de acerto
func play_acerto():
	if not is_muted:
		sound_acerto.play()

# Função para tocar som de erro
func play_erro():
	if not is_muted:
		sound_erro.play()

func play_click():
	sound_click.play()

# Toca som de dropLetter (novo)
func play_dropLetter():
	sound_dropLetter.play()
	
func play_fase_correta():
	sound_fase_correta.play()
	
func play_fase_errada():
	sound_fase_errada.play()

# Ajusta o volume dos efeitos
func set_volume_efeitos(value: float):
	volume_efeitos = value
	
	# Verifica se os sons foram inicializados corretamente antes de acessar volume_db
	if sound_acerto != null:
		sound_acerto.volume_db = linear_to_db(value)
	if sound_erro != null:
		sound_erro.volume_db = linear_to_db(value)
	if sound_click != null:
		sound_click.volume_db = linear_to_db(value)  # Ajusta o volume do som de click
	if sound_dropLetter != null:
		sound_dropLetter.volume_db = linear_to_db(value)
	if sound_fase_correta != null:
		sound_fase_correta.volume_db = linear_to_db(value)
	if sound_fase_errada != null:
		sound_fase_errada.volume_db = linear_to_db(value)

# Função para converter linear para dB (ajustando a faixa)
func linear_to_db(linear: float) -> float:
	if linear <= 0:
		return -40  # Silêncio total
	# Fazendo o mapeamento de 0 a 1 para -40 dB a -20 dB
	return -40 + (20 * linear)  # Agora 1.0 será mapeado para -20 dB, e 0.0 para -40 dB

# Função para converter dB para linear (escala 0.0 a 1.0)
func db_to_linear(db: float) -> float:
	# Fazendo o inverso: de -40 a -20 dB para a faixa linear de 0.0 a 1.0
	return (db + 40) / 20
