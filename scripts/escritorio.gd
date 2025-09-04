extends Node2D
@onready var hover_label = $Label

# Variável para controlar se já está mostrando texto
var mostrando_texto_longo = false

func _ready() -> void:
	$dica.input_event.connect(_on_input_event_dica)
	$dica.mouse_entered.connect(_on_mouse_entered_dica)
	$dica.mouse_exited.connect(_on_mouse_exited_dica)
	
	$receita.input_event.connect(_on_input_event_receita)
	$receita.mouse_entered.connect(_on_mouse_entered_receita)
	$receita.mouse_exited.connect(_on_mouse_exited_receita)
	
	$papel.mouse_entered.connect(_on_mouse_entered_papel)
	$papel.mouse_exited.connect(_on_mouse_exited_papel)
	
	$laudo.mouse_entered.connect(_on_mouse_entered_laudo)
	$laudo.mouse_exited.connect(_on_mouse_exited_laudo)
	$laudo.input_event.connect(_on_input_event_laudo)
	
	$codigof3.mouse_entered.connect(_on_mouse_entered_codigo)
	$codigof3.mouse_exited.connect(_on_mouse_exited_codigo)
	$codigof3.input_event.connect(_on_input_event_codigo)
	
	$gaveta_escritorio.mouse_entered.connect(_on_mouse_entered_gaveta)
	$gaveta_escritorio.mouse_exited.connect(_on_mouse_exited_gaveta)
	$gaveta_escritorio.input_event.connect(_on_input_event_gaveta)
	
	$voltar.mouse_entered.connect(_on_mouse_entered_voltar)
	$voltar.mouse_exited.connect(_on_mouse_exited_voltar)
	$voltar.input_event.connect(_on_input_event_voltar)

func _on_mouse_entered_voltar():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "voltar para corredor"

func _on_mouse_exited_voltar():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_input_event_voltar(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://cenas/corredor.tscn")

func _on_mouse_entered_codigo():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "Um papel com letras estranhas."

func _on_mouse_exited_codigo():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_input_event_codigo(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Dados.codfase3 = true  # CORRIGIDO: = em vez de ==
		mostrando_texto_longo = true
		hover_label.visible = true
		hover_label.text = "O item está no seu inventário."
		await get_tree().create_timer(2.0).timeout
		hover_label.visible = false
		mostrando_texto_longo = false

func _on_input_event_laudo(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Dados.diag = true  # CORRIGIDO: = em vez de ==
		mostrando_texto_longo = true
		hover_label.visible = true
		hover_label.text = "O item está no seu inventário. Aperte 'seta para cima' para conseguir visualizar."
		await get_tree().create_timer(3.0).timeout
		hover_label.visible = false
		mostrando_texto_longo = false

func _on_mouse_exited_laudo():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_mouse_entered_laudo():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "Parece um laudo médico"

func _on_mouse_entered_receita():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "esse papel é confuso..."

func _on_mouse_exited_receita():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_input_event_receita(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Dados.receitaf3 = true
		mostrando_texto_longo = true
		$receita.hide()
		hover_label.visible = true
		hover_label.text = "é uma receita médica com o nome de um remedio"
		await get_tree().create_timer(2.0).timeout
		hover_label.text = "não conheço esse nome... talvez um papel tenha alguma conexão com o outro"
		await get_tree().create_timer(3.0).timeout
		hover_label.visible = false
		mostrando_texto_longo = false

func _on_mouse_entered_dica():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "parece importante."

func _on_mouse_exited_dica():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_input_event_dica(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		Dados.dica = true
		mostrando_texto_longo = true
		hover_label.visible = true
		$dica.hide()
		hover_label.text = "A cura começa pelo final"
		await get_tree().create_timer(2.0).timeout
		hover_label.text = "que estranho."
		await get_tree().create_timer(2.0).timeout
		hover_label.visible = false
		mostrando_texto_longo = false

func _on_mouse_entered_papel():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "nada de importante nesses papéis."

func _on_mouse_exited_papel():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_mouse_entered_gaveta():
	if not mostrando_texto_longo:
		hover_label.visible = true
		hover_label.text = "Clique aqui para interagir"

func _on_mouse_exited_gaveta():
	if not mostrando_texto_longo:
		hover_label.visible = false

func _on_input_event_gaveta(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://objetos/scene/gaveta_escritorio.tscn")
