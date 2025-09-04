extends Node2D

@onready var scene: String = " "
@onready var hover_label = $Label
@onready var quadro: PackedScene = preload("res://objetos/scene/quadro.tscn")
@onready var luz = $corredorluz2


func _ready():
	piscar_luz()
	$inimigos.hide()

	if hover_label:
		hover_label.visible = false
	$recepcao.hide()
	$escritorio.mouse_entered.connect(_on_mouse_entered_escritorio)
	$escritorio.mouse_exited.connect(_on_mouse_exited_escritorio)
	$escritorio.input_event.connect(_on_input_event_escritorio)

	
	$SalaControle.mouse_entered.connect(_on_mouse_entered_SalaControl)
	$SalaControle.mouse_exited.connect(_on_mouse_exited_SalaControl)
	$SalaControle.input_event.connect(_on_input_event_control)

	$quadro.mouse_entered.connect(_on_mouse_entered_quadro)
	$quadro.mouse_exited.connect(_on_mouse_exited_quadro)
	$quadro.input_event.connect(_on_input_event_quadro)
	
	
	
	if Dados.gravador == true:
		$recepcao.show()
		$recepcao.mouse_entered.connect(_on_mouse_entered_recepcao)
		$recepcao.mouse_exited.connect(_on_mouse_exited_recepcao)
		$recepcao.input_event.connect(_on_input_event_recepcao)
		$inimigos.show()
		
		
		

	
func _on_input_event_recepcao(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Dados.chave_control == true:
			
			get_tree().change_scene_to_file("res://cenas/levels/código.tscn")
		else :
			hover_label.text = "A porta está trancada."
	
func _on_mouse_exited_recepcao():
	if hover_label:
		hover_label.visible = false
func _on_mouse_entered_recepcao():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "ir para recepcao"

func _on_mouse_entered_quadro():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Um quadro."

func _on_mouse_entered_SalaControl():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Sala de Controle"

func _on_mouse_exited_quadro():
	if hover_label:
		hover_label.visible = false

func _on_mouse_exited_SalaControl():
	if hover_label:
		hover_label.visible = false
func _on_mouse_entered_escritorio():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Escritório"

func _on_mouse_exited_escritorio():
	if hover_label:
		hover_label.visible = false
	
func _on_input_event_escritorio(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Dados.chave_escritorio == true:
			
			scene = "res://cenas/levels/escritorio.tscn"
			get_tree().change_scene_to_file("res://cenas/levels/escritorio.tscn")
		else:
			hover_label.text = "está trancada"
	
func _on_input_event_quadro(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var instancia = quadro.instantiate()
		add_child(instancia)
		
	
func _on_input_event_control(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Dados.chave_control == true:
			
			scene = "res://cenas/levels/sala_control.tscn"
			get_tree().change_scene_to_file("res://cenas/levels/sala_control.tscn")
		else :
			hover_label.text = "A porta está trancada."
func piscar_luz():
	# Inicia uma corrotina para piscar a luz por 3 segundos
	piscar_luz_corrotina()

func piscar_luz_corrotina() -> void:
	# Luz piscará durante 3 segundos (ou 6 ciclos de 0.5s)
	var tempo_total = 3.0
	var tempo_passado = 0.0
	var intervalo = 0.5

	while tempo_passado < tempo_total:
		luz.visible = not luz.visible  # Alterna visibilidade da luz
		await get_tree().create_timer(intervalo).timeout
		tempo_passado += intervalo

	# Depois de piscar, deixar a luz acesa
	luz.visible = true
