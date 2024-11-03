extends Node2D

@export var orbit : Node

func _draw():
    if orbit:
        draw_circle(Vector2.ZERO, orbit.a, Color.FIREBRICK, false, 2)
