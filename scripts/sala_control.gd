extends Node2D
@onready var hover_label = $Label

func _ready() -> void:
	
	$gaveta_control.mouse_entered.connect(_on_mouse_entered_gaveta)
	$gaveta_control.mouse_exited.connect(_on_mouse_exited_gaveta)
	$gaveta_control.input_event.connect(_on_input_event_gaveta)
	
	$voltar.mouse_entered.connect(_on_mouse_entered_voltar)
	$voltar.mouse_exited.connect(_on_mouse_exited)
	$voltar.input_event.connect(_on_input_event_voltar)
	
	
func _on_mouse_entered_voltar():
	hover_label.visible = true
	hover_label.text ="voltar para corredor"
func _on_mouse_exited():
	hover_label.visible = false 
func _on_input_event_voltar(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://cenas/corredor.tscn")
func _on_input_event_gaveta(_viewport, event, _shape_idx):
		if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			get_tree().change_scene_to_file("res://objetos/scene/gaveta_control.tscn")
		#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			#get_tree().change_scene_to_file(gaveta)
	
func _on_mouse_entered_gaveta():
	hover_label.visible = true
	hover_label.text = "clique para enteragir"
	
func _on_mouse_exited_gaveta():
	hover_label.visible = false
	
