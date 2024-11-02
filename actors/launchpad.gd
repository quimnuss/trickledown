extends Node2D

@onready var cannon: Sprite2D = $Cannon

var ROTATION_SPEED := 0.1*PI
var POWER_SPEED := 10

var power := 100

func _process(delta: float) -> void:
    if Input.is_action_pressed('right'):
        cannon.rotation += ROTATION_SPEED*delta
    elif Input.is_action_pressed('left'):
        cannon.rotation -= ROTATION_SPEED*delta

    if Input.is_action_pressed('up'):
        power += POWER_SPEED

    elif Input.is_action_pressed('down'):
        power -= POWER_SPEED
