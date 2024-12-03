extends Node2D
class_name Capitalization

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

func pop_to_feed(karma : EventsReader.Karma, building_name : String):
    var msg : String = tr('CAPITALIZED') if karma == EventsReader.Karma.BAD else tr('FREED')
    var feed : Feed = get_tree().get_first_node_in_group("feeds")
    if is_instance_valid(feed):
        var event_data : Dictionary = {
            'richmen' : '',
            'content': '%s %s' % [get_parent().name, msg],
            'content_' + Config.lang: '%s %s' % [get_parent().name, msg],
            'karma' : EventsReader.Karma.BAD
        }
        feed.pop_event(event_data)

func capitalize():
    is_liberated = false
    get_parent().modulate = Color.DIM_GRAY
    for sprite : LoopingSprite in looping_sprites:
        sprite.stop()
    if is_instance_valid(animation_player):
        animation_player.stop()
    pop_to_feed(EventsReader.Karma.BAD, get_parent().name)


func liberate():
    is_liberated = true
    get_parent().modulate = Color.WHITE
    for sprite : LoopingSprite in looping_sprites:
        sprite.restart()
    if is_instance_valid(animation_player):
        animation_player.play()
    pop_to_feed(EventsReader.Karma.GOOD, get_parent().name)


func _on_interact_area_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        dance()
