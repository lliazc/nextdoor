extends Node2D

@export var scene_to_load: String = "res://cenas/corredor.tscn"
@onready var hover_label: Label = $Label

func _ready():
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
		if scene_to_load != "res://cenas/corredor.tscn":
			get_tree().change_scene_to_file("res://cenas/corredor.tscn")
