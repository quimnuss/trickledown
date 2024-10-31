extends RigidBody2D

@export var engine_power = 1200
@export var spin_power = 10000

var thrust = Vector2.ZERO
var rotation_dir = 0

@onready var ship_center: Node2D = $ShipCenter

func get_input():
    thrust = Vector2.ZERO
    if Input.is_action_pressed("up"):
        thrust = -transform.y * engine_power
        ship_center.exhaust(1)
    else:
        ship_center.exhaust(0)
    rotation_dir = Input.get_axis("left", "right")

func _physics_process(_delta):
    get_input()
    constant_force = thrust
    constant_torque = rotation_dir * spin_power
