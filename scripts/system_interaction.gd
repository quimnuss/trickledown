extends Node

@onready var camera: ZoomingCamera2DCentered = %ZoomingCamera2D

@export var celestials : Array[Node2D]

var celestial_focus_index := 1

func _ready():
    var celestials_nodes : Array[Node] = get_tree().get_nodes_in_group("celestials")
    celestials.assign(celestials_nodes)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed('ui_focus_prev') or event.is_action_pressed('ui_focus_next'):
        if camera.get_parent() is Astronaut:
            celestial_focus_index = 1
            center_camera()
            # TODO we can probably reparent via Singleton instead of celestials (delete celestials)
            Singleton.focused_body = celestials[celestial_focus_index]
        elif event.is_action_pressed('ui_focus_prev'):
            celestial_focus_index = (celestial_focus_index-1)%celestials.size()
            center_camera()
            # TODO we can probably reparent via Singleton instead of celestials (delete celestials)
            Singleton.focused_body = celestials[celestial_focus_index]
        elif event.is_action_pressed('ui_focus_next'):
            celestial_focus_index = (celestial_focus_index+1)%celestials.size()
            center_camera()
            # TODO we can probably reparent via Singleton instead of celestials (delete celestials)
            Singleton.focused_body = celestials[celestial_focus_index]

func center_camera():
    var celestial : Node2D = celestials[celestial_focus_index]
    camera.reparent(celestial)
    camera.position = Vector2.ZERO
