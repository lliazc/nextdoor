extends Node2D

func _ready() -> void:
	$Chave.hide()
	$"CódigoFase1".hide()
	if Dados.chave_quarto:
		$Chave.show()
	if  Dados.codfase1:
		$"CódigoFase1".show()
