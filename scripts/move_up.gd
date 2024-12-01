extends Node2D

@export var speed := -10.0

var displacement : float = 0

@export var start_position : Vector2

func _ready():
    start_position = position

func _process(delta: float) -> void:
    displacement = fmod(displacement + delta * speed, 100)
    position.y = start_position.y + displacement
