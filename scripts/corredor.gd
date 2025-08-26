extends Node2D

@onready var quarto_scene: String = "res://cenas/levels/quarto1.tscn"
@onready var escritorio_scene: String = "res://cenas/levels/escritorio.tscn"
@onready var control_scene: String = "res://cenas/levels/sala_control.tscn"
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



func _on_mouse_entered_SalaControl():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Sala de Controle"

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
		if escritorio_scene != "res://cenas/levels/escritorio.tscn":
			get_tree().change_scene_to_file("res://cenas/levels/escritorio.tscn")
	
func _on_input_event_control(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if control_scene!= "res://cenas/levels/sala_control.tscn":
			get_tree().change_scene_to_file("res://cenas/levels/sala_control.tscn")
	
