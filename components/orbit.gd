extends Node2D

@export var speed = 0.1
@export var a = 500
@export var b = 500

var G : float = 1
var M : float = 1

var theta : float = 0
var offset : Vector2 = Vector2(-50, 0)

var previous_position : Vector2 = Vector2(-a, 0)

func _ready():
    pass

#func _draw():
  #draw_polyline(Transform2D(0, Vector2(-r, -r)) * curve.get_baked_points(), Color.RED, 2.0)



func _physics_process(delta):

    var current_position : Vector2 = get_parent().position

    var previous_speed : Vector2 = (current_position - previous_position)/delta

    var speed_x = previous_speed.x + G*M/current_position.x
    var speed_y = previous_speed.x + G*M/current_position.x

    # speed = fer-ho en funció de les forces (GM) unidimensionalment

    theta += delta * speed
    get_parent().position = offset + Vector2(a * cos(theta), b * sin(theta))
