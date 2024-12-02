extends Node2D

@export var looping_sprites : Array[LoopingSprite]
@export var animation_player : AnimationPlayer

func dance():
    prints(get_parent().name, 'is dancing')
    for sprite : LoopingSprite in looping_sprites:
        sprite.restart()
    if is_instance_valid(animation_player):
        animation_player.stop()
        animation_player.play()

func _on_interact_area_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
    print(event)
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        dance()
