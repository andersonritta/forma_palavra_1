extends CanvasLayer

@onready var play_button = $Control/Play
@onready var options_button = $Control/Options
@onready var credits_button = $Control/Credits

func _ready():
	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/teste_touch.tscn")
	pass

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")
	pass
	

func _on_credits_pressed():
	#get_tree().change_scene_to_file()
	pass
