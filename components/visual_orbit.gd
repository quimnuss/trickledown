extends Node2D

@export var orbit : Node

func _draw():
    if orbit:
        draw_polyline(orbit.curve.get_baked_points(), Color.RED, 2.0)
