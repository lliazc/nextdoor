extends Area2D  # Ou Node2D se preferir

@export var target_scene: String = "res://objetos/scene/mala.tscn"

func _ready():
	# Conecta os sinais se for uma Area2D
	if self is Area2D:
		input_event.connect(_on_input_event)

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if target_scene != "":
			get_tree().change_scene_to_file(target_scene)
