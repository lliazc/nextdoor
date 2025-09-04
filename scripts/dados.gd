extends Node

# Suas variáveis existentes
var chave_quarto = false
var chave_escritorio = false
var chave_control = false
var codfase1 = false
var dica = false
var receitaf3 = false
var diag = false
var tradutor = false
var gravador = false
var codfase3 = false
var senha = "louca"


# Variáveis para controle do inventário
var inventario_aberto = false
var inventario_instancia = null
var inventario_cena = preload("res://cenas/inventario.tscn")

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	if gravador == true:
		print("to true ops rs")

func _input(event):
	if Input.is_action_just_pressed("inventario"):
		toggle_inventario()

func toggle_inventario():
	if inventario_aberto:
		fechar_inventario()
	else:
		abrir_inventario()

func abrir_inventario():
	if inventario_aberto:
		return
	
	inventario_instancia = inventario_cena.instantiate()
	get_tree().root.add_child(inventario_instancia)
	inventario_aberto = true
	print("Inventário aberto")

func fechar_inventario():
	if not inventario_aberto or not inventario_instancia:
		return
	
	inventario_instancia.queue_free()
	inventario_instancia = null
	inventario_aberto = false
	print("Inventário fechado")
