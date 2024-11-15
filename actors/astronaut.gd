extends RigidBody2D
class_name Astronaut

var id : int

@warning_ignore("unused_signal")
signal death(id : int)

@onready var astronaut_controller: AstronautController = $AstronautController

func _ready() -> void:
    add_to_group('richmen')
    apply_central_impulse(Vector2(0,100))


func _on_portrait_gui_input(event : InputEvent):
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        focus()

func focus():
    var camera := get_viewport().get_camera_2d()
    camera.reparent(self)
    camera.position = Vector2.ZERO
    Singleton.focused_body = self

func dispossess():
    astronaut_controller.dispossess()

func possess():
    astronaut_controller.possess()
