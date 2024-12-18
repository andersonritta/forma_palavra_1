extends AudioStreamPlayer


const levelMusic = preload("res://assets/Audio/puzzle-game-bright-casual-video-game-music-249202.mp3")

func _playMusic(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func playMusicLevel():
	_playMusic(levelMusic, get_volume())

func set_volume(value: float):
	# Converte valor linear (0.0 a 1.0) para dB e aplica no volume_db
	volume_db = linear_to_db(value)

func get_volume() -> float:
	# Retorna o volume atual em escala linear (0.0 a 1.0)
	return db_to_linear(volume_db)

# Converte escala linear (0.0 a 1.0) para decibéis (logarithmic scale)
func linear_to_db(linear: float) -> float:
	if linear <= 0:
		return -80  # Silêncio total
	return 20 * log(linear) / log(10)

# Converte escala de decibéis para linear (0.0 a 1.0)
func db_to_linear(db: float) -> float:
	return pow(10, db / 20)
	
