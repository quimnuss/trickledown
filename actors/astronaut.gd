extends RigidBody2D
class_name Astronaut

func _ready() -> void:
    apply_central_impulse(Vector2(0,100))
