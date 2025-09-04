extends CharacterBody2D

func _ready():
	# Conecta apenas o sinal de input_event
	$Area2D.input_event.connect(_on_input_event)

func _on_input_event(viewport, event, shape_idx):
	# Verifica se foi um clique do mouse
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			# Remove o inimigo imediatamente
			queue_free()
