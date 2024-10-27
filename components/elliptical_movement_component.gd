extends Node

@export var OrbitedBody : Node2D

var r_apoapsis : float = 100
var theta_0 : float = 0

@export var excentricity : float = 0.5
@export var a_major : float = 100

func polar2cartesian(radius : float, angle : float) -> Vector2:
    return radius * Vector2.from_angle(angle)

func r_from_theta(theta : float) -> float:
    var e_sq : float = excentricity*excentricity
    var r_squared : float = a_major * (1 - e_sq) / (1 - e_sq * cos(theta) ** 2)
    return sqrt(r_squared)

func _process_physics(delta: float) -> void:
    var papa : Node2D = get_parent()

    # TODO orbital calculation over time

    papa.position = Vector2.ZERO
