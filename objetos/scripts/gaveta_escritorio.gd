extends Node2D
@onready var hover_label = $Label

func _ready() -> void:
	# Conectar sinais da chave
	$areagaveta/chave_control.mouse_entered.connect(_on_mouse_entered)
	$areagaveta/chave_control.mouse_exited.connect(_on_mouse_exited)
	$areagaveta/chave_control.input_event.connect(_on_input_event_chave)
	
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
			# Verifica se clicou na área da gaveta ou na chave
			if result.collider == $areagaveta or result.collider == $areagaveta/chave_control:
				clicou_na_gaveta = true
				break
		
		# Se não clicou na gaveta nem na chave, fecha a cena
		if not clicou_na_gaveta:
			get_tree().change_scene_to_file("res://cenas/levels/escritorio.tscn")

func _on_mouse_entered():
	hover_label.visible = true
	hover_label.text = "Outra chave."

func _on_mouse_exited():
	hover_label.visible = false

func _on_input_event_chave(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Pegar a chave
		Dados.chave_control = true
		print("Chave de controle pega!")
		
		# Esconder a chave visualmente
		$areagaveta/chave_control.hide()
		
		# Mostrar mensagem de feedback
		await get_tree().create_timer(1.5).timeout
		
		# Fechar a cena após pegar a chave
		get_tree().change_scene_to_file("res://cenas/levels/escritorio.tscn")
