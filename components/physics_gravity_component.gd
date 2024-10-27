extends Node

@export var max_gravity_radius : float = 10000
@export var gravity_at_center : float = 50

@export var ignore : bool = false

func _ready():
    add_to_group('gravity_component')

func get_gravity_at(pos : Vector2) -> Vector2:
    if ignore:
        return Vector2.ZERO

    var papa : Node2D = get_parent()
    var distance : float = (papa.global_position - pos).length()

    # if pos outside of radius return no gravity
    if distance > max_gravity_radius:
        return Vector2.ZERO

    # return calculated gravity vector
    return gravity_at_center * (papa.global_position - pos).normalized() * (1 -(distance / max_gravity_radius))
