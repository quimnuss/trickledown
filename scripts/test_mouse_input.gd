extends Area2D



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    print(event)


func _on_mouse_entered() -> void:
    print('mouse_in')
