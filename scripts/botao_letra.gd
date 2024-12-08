#extends Node2D
#
#var draggable = false
#var dropable_areas = []
#var offset: Vector2
#var initialPos: Vector2
#
#func _process(delta):
	#if draggable:
		#if Input.is_action_just_pressed("click"):
			#initialPos = global_position
			#offset = get_global_mouse_position() - global_position
#
		#if Input.is_action_pressed("click"):
			#global_position = get_global_mouse_position() - offset
#
		#elif Input.is_action_just_released("click"):
			#var tween = get_tree().create_tween()
#
			#if dropable_areas.size() > 0:
				#var closest_area = get_closest_dropable()
#
				#if closest_area:
					#tween.tween_property(self, "position", closest_area.position, 0.2).set_ease(Tween.EASE_OUT)
#
			#else:
				#tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)
#
#
#func _on_area_2d_mouse_entered() -> void:
	#print('deu ruim')
	#draggable = true
	#scale = Vector2(1.05, 1.05)
#
#
#func _on_area_2d_mouse_exited() -> void:
	#draggable = false
	#scale = Vector2(1, 1)
#
#
#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.is_in_group('dropable') and not body.is_in_group('draggable'):
		#dropable_areas.append(body)
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#if body.is_in_group('dropable') and not body.is_in_group('draggable'):
		#dropable_areas.erase(body)
#
#
#func get_closest_dropable() -> Node2D:
	#var closest_area = null
	#var closest_distance = INF
	#
	#for area in dropable_areas:
		#var distance = global_position.distance_to(area.global_position)
#
		#if distance < closest_distance:
			#closest_distance = distance
			#closest_area = area
#
	#return closest_area


extends Node2D

var draggable = false
var dropable_areas = []
var offset: Vector2
var initialPos: Vector2

func _input(event):
	print(global_position)
	# Detectar início do clique ou toque
	if (event is InputEventScreenTouch or event is InputEventMouseButton) and event.pressed and draggable:
		initialPos = global_position
		offset = event.position - global_position
	
	# Detectar arrasto do mouse ou dedo
	elif (event is InputEventScreenDrag or event is InputEventMouseMotion) and draggable:
		global_position = event.position - offset
	
	# Detectar final do clique ou toque
	elif (event is InputEventScreenTouch or event is InputEventMouseButton) and not event.pressed and draggable:
		var tween = get_tree().create_tween()
		
		if dropable_areas.size() > 0:
			var closest_area = get_closest_dropable()

			if closest_area:
				tween.tween_property(self, "position", closest_area.position, 0.2).set_ease(Tween.EASE_OUT)
		else:
			tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)


func _on_area_2d_input_event(viewport, event, shape_idx) -> void:
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
