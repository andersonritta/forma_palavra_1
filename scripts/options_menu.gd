extends CanvasLayer

@onready var music_slider = $"Control/TextureRect/Volume Music"
@onready var fx_volume = $"Control/TextureRect/Volume FX"
@onready var reset_button = $"Control/TextureRect/Reset Button"
@onready var quit_button = $"Control/TextureRect/Quit Button"
@onready var animation_player = $Control/AnimationPlayer

var is_paused = false

func _ready() -> void:
	pass

func _unhandled_input(event):
	pass

func on_close_pressed():
	hide_pause_menu()
	pass

func show_options_menu():
	get_tree().paused = true
	visible = true
	is_paused = true
	
	animation_player.play("fade_in")
	await animation_player.animation_finished

func hide_pause_menu():
	animation_player.play("fade_out")
	await animation_player.animation_finished
	
	get_tree().paused = false
	visible = false
	is_paused = false
	pass
