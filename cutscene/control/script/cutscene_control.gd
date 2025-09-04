extends Node2D

@onready var anim = $AnimationPlayer
func _ready() -> void:
	Dados.gravador == true
	anim.animation_finished.connect(_on_animation_finished)
	anim.play("audios")
	
func play_anim(s: String):
	anim.play(s)
	
func stop_anim():
	anim.stop()
	# Não mudar cena aqui, deixar para o signal

func _on_animation_finished(anim_name: String):
	if anim_name == "audios":
		get_tree().change_scene_to_file("res://cenas/levels/sala_control.tscn")
