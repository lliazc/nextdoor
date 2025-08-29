extends Area2D

@onready var gaveta = $GavetaComChaveFase1
@onready var collision_shape = $CollisionShape2D  # Referência direta ao CollisionShape2D
@onready var hover_label = $Label
func _ready():
	if gaveta:
		gaveta.visible = true

	if hover_label:
		hover_label.visible = false
	$papel.mouse_entered.connect(_on_mouse_entered_papel)
	$papel.mouse_exited.connect(_on_mouse_exited_papel)

	
	$remedios.mouse_entered.connect(_on_mouse_entered_remedios)
	$remedios.mouse_exited.connect(_on_mouse_exited_remedios)
	
	$chave.mouse_entered.connect(_on_mouse_entered_chave)
	$chave.mouse_exited.connect(_on_mouse_exited_chave)


func _on_mouse_entered_chave():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Uma chave."

func _on_mouse_exited_chave():
	if hover_label:
		hover_label.visible = false

func _on_mouse_exited_remedios():
	if hover_label:
		hover_label.visible = false
		
func _on_mouse_entered_remedios():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Remedios.."
func _on_mouse_entered_papel():
	if hover_label:
		hover_label.visible = true
		hover_label.text = "Nada importante."

func _on_mouse_exited_papel():
	if hover_label:
		hover_label.visible = false

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var mouse_pos = get_global_mouse_position()
		
		# Verifica se o clique NÃO foi em nenhuma área colidível da gaveta
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsPointQueryParameters2D.new()
		query.position = mouse_pos
		query.collision_mask = collision_mask
		query.collide_with_areas = true
		query.collide_with_bodies = false
		
		var results = space_state.intersect_point(query)
		var clicou_na_gaveta = false
		
		for result in results:
			if result.collider == self:
				clicou_na_gaveta = true
				break
		
		# Se não clicou na gaveta, fecha
		if not clicou_na_gaveta:
			_fechar_gaveta()

func _fechar_gaveta():
	# Volta para a cena anterior
	get_tree().change_scene_to_file("res://cenas/levels/quarto1.tscn")
