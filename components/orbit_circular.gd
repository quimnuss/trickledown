extends Node2D

@export var speed = 0.01
@export var a = 500

var theta : float = 0


func _physics_process(delta : float):
    theta += delta * speed
    get_parent().position = a * Vector2(cos(theta), sin(theta))
