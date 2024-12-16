extends Node2D

var draggable = false
var dropable_areas = []
var offset: Vector2
var initialPos: Vector2
var letra: String  # Armazena a letra associada
var origin

func _ready() -> void:
	initialPos = position  # Salva a posição inicial da letra
	origin = position

# Define a letra associada à instância da letra
func set_letra(nova_letra: String) -> void:
	letra = nova_letra

func _input(event):
	# Detectar início do clique ou toque
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.pressed and draggable:
		pass
	
	# Detectar arrasto do mouse ou dedo
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and draggable:
		global_position = event.position - offset
	
	# Detectar final do clique ou toque
	elif (event is InputEventScreenTouch or event is InputEventMouseButton) and not event.pressed and draggable:
		var tween = get_tree().create_tween()

		if dropable_areas.size() > 0:
			var closest_area = get_closest_dropable()

			if closest_area:
				# Passa a letra para o slot
				closest_area.receber_letra(self)  # Passa a referência da letra
				tween.tween_property(self, "position", closest_area.position, 0.2).set_ease(Tween.EASE_OUT)
			else:
				# Retorna à posição inicial
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
		else:
			# Retorna à posição inicial
			tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		draggable = true
		scale = Vector2(1.05, 1.05)
		move_to_front()
	elif event is InputEventScreenTouch and not event.pressed:
		draggable = false
		scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('dropable') and not body.is_in_group('draggable'):
		dropable_areas.append(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group('dropable') and not body.is_in_group('draggable'):
		dropable_areas.erase(body)

func get_closest_dropable() -> Node2D:
	var closest_area = null
	var closest_distance = INF
	
	for area in dropable_areas:
		var distance = global_position.distance_to(area.global_position)
		if distance < closest_distance:
			closest_distance = distance
			closest_area = area

	return closest_area

func reset_position():
	global_position = origin
