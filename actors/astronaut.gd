extends RigidBody2D

func _ready() -> void:
    apply_central_impulse(Vector2(0,100))

func _process_physics(delta: float) -> void:
    pass
