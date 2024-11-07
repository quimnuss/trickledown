extends RigidBody2D
class_name Astronaut

var id : int

signal death(id : int)

func _ready() -> void:
    apply_central_impulse(Vector2(0,100))
