extends Area2D  # A raiz da cena mala.tscn deve ser Area2D

@onready var mala_aberta = $MalaAberta  # Ajuste para o nome do seu nó

func _ready():
	# Garante que a mala esteja visível quando aberta
	if mala_aberta:
		mala_aberta.visible = true
	
	# Conecta o sinal de input
	input_event.connect(_on_input_event)

func _on_input_event(_viewport, event, _shape_idx):
	# Se clicar na própria mala, não faz nada (ou pode adicionar comportamento)
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Verifica se o clique foi fora da área da mala
		var mouse_pos = get_global_mouse_position()
		var local_mouse_pos = to_local(mouse_pos)
		
		# Se não clicou dentro da área da mala, volta para a cena anterior
		if not $CollisionShape2D.shape.get_rect().has_point(local_mouse_pos):
			_fechar_mala()

func _fechar_mala():
	# Volta para a cena anterior
	get_tree().change_scene_to_file("res://cenas/levels/quarto1.tscn")  # Ajuste o caminho
	# Ou alternativamente: get_tree().reload_current_scene()
