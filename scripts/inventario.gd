extends CanvasLayer

var inventario = preload("res://cenas/inventario.tscn")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_up"):
		var instance = inventario.instantiate()
		add_child(instance)
		await get_tree().create_timer(5.0).timeout
		instance.queue_free()
