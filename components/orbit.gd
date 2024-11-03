extends Node2D

@export var speed = 0.1
@export var a = 500
@export var b = 500

var theta : float = 0
var offset : Vector2 = Vector2(-50, 0)
func _ready():
    pass

#func _draw():
  #draw_polyline(Transform2D(0, Vector2(-r, -r)) * curve.get_baked_points(), Color.RED, 2.0)

func _physics_process(delta):
    theta += delta * speed
    get_parent().position = offset + Vector2(a * cos(theta), b * sin(theta))
