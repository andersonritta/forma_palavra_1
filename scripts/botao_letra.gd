#extends Node2D
#
#var draggable = false
#var is_inside_dropable = false
#var body_ref
#var offset: Vector2
#var initialPos: Vector2
#
#func _process(delta):
	#if draggable:
		#if Input.is_action_just_pressed("click"):
			#initialPos = global_position
			#offset = get_global_mouse_position() - global_position
		#if Input.is_action_pressed("click"):
			#global_position = get_global_mouse_position() - offset
		#elif Input.is_action_just_released("click"):
			#var tween = get_tree().create_tween()
			#if is_inside_dropable:
				#tween.tween_property(self, "position", body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			#else:
				#tween.tween_property(self, "global_position", initialPos,0.2).set_ease(Tween.EASE_OUT)
	#
#
#func _on_area_2d_mouse_entered() -> void:
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
	#if body.is_in_group('dropable'):
		#is_inside_dropable = true
		#body_ref = body
#
#
#func _on_area_2d_body_exited(body: Node2D) -> void:
	#if body.is_in_group('dropable') && body_ref == body:
		#is_inside_dropable = false

extends Node2D

var draggable = false
var dropable_areas = [] # Armazena as áreas dropáveis atualmente sobrepostas
var offset: Vector2
var initialPos: Vector2

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			var tween = get_tree().create_tween()
			if dropable_areas.size() > 0:
				print("yay")
				# Encontre a área mais próxima
				var closest_area = get_closest_dropable()
				if closest_area:
					print("porra")
					tween.tween_property(self, "position", closest_area.position, 0.0001).set_ease(Tween.EASE_OUT)
				pass
			else:
				# Retorne à posição inicial
				tween.tween_property(self, "global_position", initialPos, 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_mouse_entered() -> void:
	draggable = true
	scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited() -> void:
	draggable = false
	scale = Vector2(1, 1)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('dropable'):
		print("entrou")
		dropable_areas.append(body)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group('dropable'):
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

		
