extends Node2D


#func _ready() -> void:
    #var tween : Tween = create_tween().set_loops()
    #tween.tween_property(self, "rotation", 2*PI, 3).from(0)

@export var speed = 0.01
@export var a : float = 1400.0 

var theta : float = 0

var r_p = 100
var r_apoapsis = 200

func _physics_process(delta : float):
    theta += delta * speed
    self.position = a * Vector2(cos(theta), sin(theta))
