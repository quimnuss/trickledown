extends Node2D
class_name Interactable

@export var looping_sprites : Array[LoopingSprite]
@export var animation_player : AnimationPlayer
@onready var interact_area: Area2D = $InteractArea

var is_liberated : bool = true

func _ready():
    interact_area.input_event.connect(_on_interact_area_input_event)

func dance():
    prints(get_parent().name, 'is dancing')
    get_parent().modulate = Color.WHITE
    for sprite : LoopingSprite in looping_sprites:
        sprite.restart()
    if is_instance_valid(animation_player):
        animation_player.stop()
        animation_player.play()
    if not is_liberated:
        await get_tree().create_timer(5).timeout
        if not is_liberated:
            capitalize()    

func capitalize():
    is_liberated = false
    get_parent().modulate = Color.DIM_GRAY
    for sprite : LoopingSprite in looping_sprites:
        sprite.stop()
    if is_instance_valid(animation_player):
        animation_player.stop()

func liberate():
    is_liberated = true
    get_parent().modulate = Color.WHITE
    for sprite : LoopingSprite in looping_sprites:
        sprite.restart()
    if is_instance_valid(animation_player):
        animation_player.play()


func _on_interact_area_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        dance()
