extends Area2D
@onready var label = $"../Label"


func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		label.text = "Você encontrou a chave"
		Dados.chave_quarto = true
		queue_free()
