extends Node2D

@export var speed = 100
var curve := Curve2D.new()
@export var a = 500
@export var b = 500
var bppos = 0

func _ready():
    curve.add_point(Vector2(a,0),Vector2(0,-b))
    curve.add_point(Vector2(0,b),Vector2(a,0))
    curve.add_point(Vector2(-a,0),Vector2(0,b))
    curve.add_point(Vector2(0,-b),Vector2(-a,0))
    curve.add_point(Vector2(a,0),Vector2(0,-b))
    curve.set_bake_interval(1)

#func _draw():
  #draw_polyline(Transform2D(0, Vector2(-r, -r)) * curve.get_baked_points(), Color.RED, 2.0)

func _physics_process(delta):
    if bppos + delta*speed >= curve.get_baked_points().size():
        bppos += delta*speed - curve.get_baked_points().size()
    else:
        get_parent().position = curve.get_baked_points()[round(bppos)]
        bppos += delta*speed
