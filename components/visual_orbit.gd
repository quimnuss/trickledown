extends Node2D

@onready var orbit: EllipticalOrbit = $"../Satellite/Orbit"

func _draw():
    draw_set_transform(Vector2.ZERO, 0, Vector2(1, orbit.b/orbit.a))
    draw_circle(orbit.offset, orbit.a, Color.GREEN, false, 1.0)
