extends RigidBody2D
class_name Astronaut

var richman_data : RichmanData

signal death(richman_data : RichmanData)

@onready var astronaut_controller: AstronautController = $AstronautController

signal milestone_completed(milestone_enum : Singleton.Milestone)

func _ready() -> void:
    add_to_group('richmen')
    add_to_group('milestoners')

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

func kill():
    var camera : ZoomingCamera2DCentered = get_viewport().get_camera_2d()
    if camera.get_parent() == self:
        camera.detach()
    death.emit(self.richman_data)
    queue_free()


func _on_body_entered(body: Node) -> void:
    for collider in get_colliding_bodies():
        if collider is Astronaut:
            print("crashed with",collider.name)
            milestone_completed.emit(Singleton.Milestone.CRASH_ASTRONAUT)
            break
            
