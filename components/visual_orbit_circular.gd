extends Node2D

@export var planet : Node

func _draw():
    if planet:
        draw_circle(Vector2.ZERO, planet.orbit.a, Color.FIREBRICK, false, 2)
