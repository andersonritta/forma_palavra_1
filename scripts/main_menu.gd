extends CanvasLayer

@onready var play_button = $Play
@onready var options_button = $Options
#@onready var credits_button = $Control/Credits

func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass


func _on_options_pressed():
	OptionsMenu.show_pause_menu()
	pass


func _on_exit_game_button_pressed():
	get_tree().quit()
