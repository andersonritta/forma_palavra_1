extends Button

var original_position: Vector2
var target_space: Node = null

func _ready():
	original_position = global_position

func _on_gui_input(event):
	if event is InputEventMouseMotion and event.button_mask & MOUSE_BUTTON_LEFT:
		global_position += event.relative
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed == false:
		if target_space and target_space.get("expected_letter") == text:
			target_space.text = text
			queue_free()  # Remove a letra do painel após posicionar
		else:
			global_position = original_position
