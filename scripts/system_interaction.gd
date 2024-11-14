extends Node

@onready var camera: ZoomingCamera2DCentered = %ZoomingCamera2D

@export var celestials : Array[Node2D]

var celestial_focus_index := 1

func _input(event: InputEvent) -> void:
    if event.is_action_pressed('ui_focus_next'):
        celestial_focus_index = (celestial_focus_index+1)%celestials.size()
        center_camera()
        # TODO we can probably reparent via Singleton instead of celestials (delete celestials)
        Singleton.focused_body = celestials[celestial_focus_index]

func center_camera():
    var celestial : Node2D = celestials[celestial_focus_index]
    camera.reparent(celestial)
    camera.position = Vector2.ZERO
