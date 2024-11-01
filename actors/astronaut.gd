extends RigidBody2D

func _ready() -> void:
    apply_central_impulse(Vector2(0,100))
