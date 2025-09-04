extends Node2D
@onready var label = $Label

func _ready() -> void:
	
	$Chave.hide()
	$"CódigoFase1".hide()
	$receita.hide()
	$diagnostico.hide()
	$gravador.hide()
	$tradutor.hide()
	$codigo3.hide()
	$dica.hide()
	
	
	if Dados.chave_quarto:
		$Chave.show()
	if  Dados.codfase1:
		$"CódigoFase1".show()
	if Dados.receitaf3:
		$receita.show()
	if Dados.diag:
		$diagnostico.show()
	if Dados.gravador:
		$gravador.show()
	if Dados.tradutor:
		$tradutor.show()
	if Dados.codfase3:
		$codigo3.show()
	if Dados.dica:
		$dica.show()
	if Dados.chave_escritorio:
		label.text = "2"
	if Dados.chave_control:
		label.text = "3"
