extends CanvasLayer

@onready var play_button = $Play
@onready var options_button = $Options
@onready var creditos_button = $Creditos
@onready var config_player = $ConfigPlayerButton

@onready var config_player_scene = preload("res://scenes/config_player.tscn")
var config_player_instance = null

func _ready():
	if not GlobalAudioStreamPlayer.is_playing():
		GlobalAudioStreamPlayer.playMusicLevel()
	
func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	SoundManager.play_click()
	
func _on_options_pressed():
	OptionsMenu.show_pause_menu()
	SoundManager.play_click()
		
func _on_creditos_pressed():
	CreditosMenu.show_pause_menu()
	SoundManager.play_click()
	
func _on_exit_game_button_pressed():
	SoundManager.play_click()
	get_tree().quit()

func _on_config_player_button_pressed() -> void:
	SoundManager.play_click()
	
	# Exibe o menu de configurações do jogador
	if config_player_instance != null:
		config_player_instance.show_pause_menu()
	
