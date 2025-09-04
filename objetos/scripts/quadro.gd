extends Node2D
@onready var label = $Area2D/Label
@onready var falas = $Area2D/Labelfalas

var quadro_girado = false
var chave_coletada = false
var processar_clique_global = true

func _ready():
	# Habilita processamento de input
	set_process_input(true)
	
	$Area2D/frente.show()
	$Area2D/comchave.hide()
	$Area2D/semchave.hide()
	$Area2D/chave.hide()
	
	# Conecta os sinais
	$Area2D/girar.input_event.connect(_on_input_event_girar)
	$Area2D/girar.mouse_entered.connect(_on_mouse_entered_)
	$Area2D/girar.mouse_exited.connect(_on_mouse_exited)
	$Area2D/chave.input_event.connect(_on_input_event_chave)
	$Area2D/chave.mouse_entered.connect(_on_mouse_entered_chave)
	$Area2D/chave.mouse_exited.connect(_on_mouse_exited_chave)
	
	falas.text = "Um quadro..."
	await get_tree().create_timer(2.5).timeout
	falas.text = "Apesar do rosto estar borrado, ele não é estranho."

func _input(event):
	if not processar_clique_global:
		return
		
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Verifica se o clique foi em qualquer área do quadro
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsPointQueryParameters2D.new()
		query.position = get_global_mouse_position()
		query.collision_mask = 1
		query.collide_with_areas = true
		query.collide_with_bodies = false
		
		var results = space_state.intersect_point(query)
		var clicou_no_quadro = false
		
		# Lista de todas as áreas que fazem parte do quadro
		var areas_do_quadro = [
			$Area2D,          # Área principal do quadro
			$Area2D/girar,    # Área do botão girar
			$Area2D/chave     # Área da chave
		]
		
		for result in results:
			for area in areas_do_quadro:
				if result.collider == area:
					clicou_no_quadro = true
					break
			if clicou_no_quadro:
				break
		
		# Se não clicou em nenhuma área do quadro, fecha a cena
		if not clicou_no_quadro:
			queue_free()
	
func _on_mouse_entered_():
	label.visible = true 
	label.text = "Clique aqui para girar"
	
func _on_mouse_exited():
	label.visible = false

func _on_mouse_entered_chave():
	if quadro_girado and not chave_coletada:
		label.visible = true 
		label.text = "Clique para pegar a chave"
	
func _on_mouse_exited_chave():
	label.visible = false
	
func _on_input_event_girar(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Desativa temporariamente a verificação global
		processar_clique_global = false
		
		if not quadro_girado:
			$Area2D/frente.hide()
			
			if chave_coletada:
				$Area2D/semchave.show()
				$Area2D/comchave.hide()
				$Area2D/chave.hide()
			else:
				$Area2D/comchave.show()
				$Area2D/semchave.hide()
				$Area2D/chave.show()
				
			quadro_girado = true			
		else:
			$Area2D/frente.show()
			$Area2D/comchave.hide()
			$Area2D/semchave.hide()
			$Area2D/chave.hide()
			quadro_girado = false
		
		# Reativa a verificação global após um pequeno delay
		await get_tree().create_timer(0.1).timeout
		processar_clique_global = true

func _on_input_event_chave(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Desativa temporariamente a verificação global
		processar_clique_global = false
		
		if quadro_girado and not chave_coletada:
			chave_coletada = true
			Dados.chave_escritorio = true
			$Area2D/chave.hide()
			$Area2D/comchave.hide()
			$Area2D/semchave.show()
			falas.text = "Você pegou a chave!"
			await get_tree().create_timer(2.0).timeout
			falas.text = "Agora posso usar esta chave em outro lugar..."
		
		# Reativa a verificação global após um pequeno delay
		await get_tree().create_timer(0.1).timeout
		processar_clique_global = true
