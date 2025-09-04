extends Node2D

@onready var anim = $AnimationPlayer
@export var fase_um = preload("res://scripts/quarto_1.gd")

func _ready() -> void:
	anim.animation_finished.connect(_on_animation_finished)
	anim.play("cutscene")
	
func play_anim(s: String):
	anim.play(s)
	
func stop_anim():
	anim.stop()
	# Não mudar cena aqui, deixar para o signal

func _on_animation_finished(anim_name: String):
	if anim_name == "cutscene":
		get_tree().change_scene_to_file("res://cenas/levels/quarto1.tscn")
