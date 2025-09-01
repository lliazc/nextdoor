extends Node2D

@onready var scene: String = " "
@onready var hover_label = $Label

func _ready():
	if hover_label:
		hover_label.visible = false
	$escritorio.mouse_entered.connect(_on_mouse_entered_escritorio)
	$escritorio.mouse_exited.connect(_on_mouse_exited_escritorio)
	$escritorio.input_event.connect(_on_input_event_escritorio)

	
	$SalaControle.mouse_entered.connect(_on_mouse_entered_SalaControl)
	$SalaControle.mouse_exited.connect(_on_mouse_exited_SalaControl)
	$SalaControle.input_event.connect(_on_input_event_control)

	$quadro.mouse_entered.connect(_on_mouse_entered_quadro)
	$quadro.mouse_exited.connect(_on_mouse_exited_quadro)
	$quadro.input_event.connect(_on_input_event_quadro)



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
		scene = "res://cenas/levels/escritorio.tscn"
		get_tree().change_scene_to_file("res://cenas/levels/escritorio.tscn")
	
func _on_input_event_quadro(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		scene = "res://objetos/scene/quadro.tscn"
		get_tree().change_scene_to_file("res://objetos/scene/quadro.tscn")
	
	
func _on_input_event_control(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		scene = "res://cenas/levels/sala_control.tscn"
		get_tree().change_scene_to_file("res://cenas/levels/sala_control.tscn")
	
