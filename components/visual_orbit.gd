extends Node2D

@export var orbit : Node

func _draw():
    draw_set_transform(Vector2.ZERO, 0, Vector2(1, 150.0/200.0))
    draw_circle(orbit.offset, orbit.a, Color.GREEN, false, 1.0)
