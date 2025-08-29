extends Area2D

@onready var mala_aberta = $MalaAberta
@onready var collision_shape = $area  # Ajuste para o nome do seu CollisionShape2D
@onready var hover_label = $Label
func _ready():
	if mala_aberta:
		mala_aberta.visible = true
		
	$boneca.mouse_entered.connect(_on_mouse_entered_boneca)
	$boneca.mouse_exited.connect(_on_mouse_exited_boneca)

	
	$papel.mouse_entered.connect(_on_mouse_entered_papel)
	$papel.mouse_exited.connect(_on_mouse_exited_papel)
	$papel.input_event.connect(_on_input_event_papel)

	
	$fotos.mouse_entered.connect(_on_mouse_entered_fotos)
	$fotos.mouse_exited.connect(_on_mouse_exited_fotos)
	
func _on_input_event_papel(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		hover_label.text = "Você encontrou um papel... com símbolos estranhos"
		Dados.codfase1 = true

func _on_mouse_entered_fotos():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Não reconheço ninguem."

func _on_mouse_exited_fotos():
	if hover_label:
		hover_label.visible = false

func _on_mouse_exited_papel():
	if hover_label:
		hover_label.visible = false
		
func _on_mouse_entered_papel():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Um papel com símbolo estranho..."
func _on_mouse_entered_boneca():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Uma boneca."

func _on_mouse_exited_boneca():
	if hover_label:
		hover_label.visible = false

	
	# Conecta o sinal body_entered ou area_entered se preferir
	input_event.connect(_on_input_event)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Clique dentro da área - não faz nada (mantém aberta)
		print("Clicou dentro da mala - mantém aberta")
		# Aqui você pode adicionar lógica para interagir com itens dentro da mala

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		
		# Verifica se o clique NÃO foi em nenhuma área colidível da mala
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsPointQueryParameters2D.new()
		query.position = mouse_pos
		query.collision_mask = collision_mask
		query.collide_with_areas = true
		query.collide_with_bodies = false
		
		var results = space_state.intersect_point(query)
		var clicou_na_mala = false
		
		for result in results:
			if result.collider == self:
				clicou_na_mala = true
				break
		
		# Se não clicou na mala, fecha
		if not clicou_na_mala:
			_fechar_mala()

func _fechar_mala():
	get_tree().change_scene_to_file("res://cenas/levels/quarto1.tscn")
