extends Node2D

@onready var entrada = $EntradaTexto
@onready var botao = $BotaoConfirmar

# Define o código correto aqui
var codigo_correto = Dados.senha

func _ready():
	botao.pressed.connect(verificar_codigo)
	entrada.text_submitted.connect(verificar_codigo)  # também permite pressionar Enter

func verificar_codigo(texto_digitado = ""):
	if texto_digitado == "":
		texto_digitado = entrada.text.strip_edges()

	if texto_digitado == codigo_correto:
		get_tree().change_scene_to_file("res://cenas/cena_final.tscn")
