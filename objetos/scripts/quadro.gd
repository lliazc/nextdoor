extends Node2D
@onready var label = $Label
@onready var falas = $Labelfalas
func _ready():
	$Area2D/frente.show()
	$Area2D/semchave.hide()
	$Area2D/Area2D/comchave.hide()
	$chave.hide()
	$girar.input_event.connect(_on_input_event_girar)
	$girar.mouse_entered.connect(_on_mouse_entered_)
	$girar.mouse_exited.connect(_on_mouse_exited)
	
	falas.text = "Um quadro..."
	await get_tree().create_timer(2.5).timeout
	falas.text = "Apesar do rosto estar borrado, ele não é estranho."
	
func _on_mouse_entered_():
	label.visible = true 
	label.text = "Clique aqui para girar"
	
func _on_mouse_exited():
	label.visible = false
	
func _on_input_event_chave(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$Area2D/Area2D/comchave.show()
		

func _on_input_event_girar(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$Area2D/Area2D/comchave.show()
		
