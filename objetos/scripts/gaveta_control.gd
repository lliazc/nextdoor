extends Node2D

@onready var hover_label = $Label

func _ready() -> void:
	$areagaveta/gravador.mouse_exited.connect(_on_mouse_exited_gravador)
	$areagaveta/gravador.input_event.connect(_on_input_event_gravador)
	$areagaveta/gravador.mouse_entered.connect(_mouse_entered_gravador)
	
	# Habilitar processamento de input para detectar cliques fora
	set_process_input(true)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Verificar se o clique foi fora da área da gaveta
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsPointQueryParameters2D.new()
		query.position = get_global_mouse_position()
		query.collision_mask = 1
		query.collide_with_areas = true
		query.collide_with_bodies = false
		
		var results = space_state.intersect_point(query)
		var clicou_na_gaveta = false
		
		for result in results:
			# Verifica se clicou na área da gaveta ou no gravador
			if result.collider == $areagaveta or result.collider == $areagaveta/gravador:
				clicou_na_gaveta = true
				break
		
		# Se não clicou na gaveta nem no gravador, muda de cena
		if not clicou_na_gaveta:
			get_tree().change_scene_to_file("res://cenas/levels/sala_control.tscn")
	
func _mouse_entered_gravador():
	hover_label.visible = true 
	hover_label.text = "Um gravador..."
	
func _on_mouse_exited_gravador():
	hover_label.visible = false
	
func _on_input_event_gravador(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Dados.gravador = true
		get_tree().change_scene_to_file("res://cutscene/control/scene/cutscene_control.tscn")
