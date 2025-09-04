extends Node2D
@onready var hover_label = $Label
@onready var codigo_cena = preload("res://cenas/codigo_text.tscn")  # Pré-carregar a cena

func _ready() -> void:
	$Area2D.mouse_entered.connect(_on_mouse_entered)
	$Area2D.mouse_exited.connect(_on_mouse_exited)
	$Area2D.input_event.connect(_on_input_event)  # Adicionar a função como parâmetro

func _on_mouse_entered():
	hover_label.visible = true
	hover_label.text = "Clique aqui para sair"
	
func _on_mouse_exited():
	hover_label.visible = false
	
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var instancia = codigo_cena.instantiate()  # Instanciar a cena
		get_parent().add_child(instancia)  # Adicionar como filho do parent
