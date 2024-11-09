extends Node
class_name Focus

@export var watched_bodies : Array[Node2D]

func _ready() -> void:
    add_to_group('focus')
    Singleton.focused_body_changed.connect(_on_focused_body_changed)
    watched_bodies.append(get_parent())

func _on_focused_body_changed():
    if Singleton.focused_body in watched_bodies:
        possessed()
    else:
        unpossessed()

func possessed():
    get_parent().set_process(true)
    get_parent().set_process_input(true)
    if get_parent().has_method("possess"):
        get_parent().possess()

func unpossessed():
    get_parent().set_process(false)
    get_parent().set_process_input(false)
    if get_parent().has_method("dispossess"):
        get_parent().dispossess()
