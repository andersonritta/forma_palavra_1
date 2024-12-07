extends Control

var is_dragging=false  # Indica se o objeto está sendo arrastado
var touchpos=0

func _input(event):
	# Detecta se o evento é de toque na tela ou clique do mouse
	if event is InputEventMouseButton:
		if event.is_pressed():  # Toque iniciado
			is_dragging = true
		else:  # Toque finalizado
			is_dragging = false
			global_position=event.position
	if is_dragging:
		touchpos=event.position

func _physics_process(delta):
	if is_dragging:
		# Move o objeto para a posição do cursor (mouse ou toque na tela)
		global_position=touchpos
