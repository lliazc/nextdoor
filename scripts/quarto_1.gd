extends Node2D

@export var scene_to_load: String = "res://cutscene/corredor/cutscene_corredor.tscn"
@onready var hover_label: Label = $Label

func _ready():
	hover_label.visible = false
	if hover_label:
		hover_label
	$mala.mouse_entered.connect(_on_mouse_entered)
	$mala.mouse_exited.connect(_on_mouse_exited)
	$mala.input_event.connect(_on_input_event)
	
	$gaveta.mouse_entered.connect(_on_mouse_entered)
	$gaveta.mouse_exited.connect(_on_mouse_exited)
	$gaveta.input_event.connect(_on_input_event)
	
	$porta.mouse_entered.connect(_on_mouse_entered)
	$porta.mouse_exited.connect(_on_mouse_exited)
	$porta.input_event.connect(_on_input_event)

func _on_mouse_entered():
	if hover_label:
		hover_label.visible = true

func _on_mouse_exited():
	if hover_label:
		hover_label.visible = false

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if scene_to_load != "res://cutscene/corredor/cutscene_corredor.tscn":
			get_tree().change_scene_to_file("res://cutscene/corredor/cutscene_corredor.tscn")
