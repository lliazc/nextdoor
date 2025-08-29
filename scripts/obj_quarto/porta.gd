extends Area2D
@onready var label = $"../Label"
@export var target_scene: String = "res://cenas/corredor.tscn"

func _ready():
	# Conecta o sinal input_event sempre
	input_event.connect(_on_input_event)
	
	# Garante que o label esteja invisível inicialmente
	if label:
		label.visible = false

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if Dados.chave_quarto:
			# Tem a chave - troca de cena
			if target_scene != "":
				get_tree().change_scene_to_file(target_scene)
		else:
			# Não tem a chave - mostra mensagem
			if label:
				label.text = "está trancada"
				label.visible = true
				
				# Opcional: esconder a mensagem após alguns segundos
				await get_tree().create_timer(2.0).timeout
				label.visible = false
