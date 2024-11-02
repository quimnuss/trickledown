extends Node2D

@onready var cannon: Sprite2D = $Cannon
@onready var fire_effect: Node2D = $Cannon/FireEffect

var ROTATION_SPEED := 0.1*PI
var POWER_SPEED := 10

var power := 100

const CANNON_INITIAL_ROTATION := PI/2 + PI/2 + PI/4

func _process(delta: float) -> void:
    if Input.is_action_pressed('right'):
        cannon.rotation += ROTATION_SPEED*delta
    elif Input.is_action_pressed('left'):
        cannon.rotation -= ROTATION_SPEED*delta

    if Input.is_action_pressed('up'):
        power += POWER_SPEED
        power = clamp(power, 0, 1000)
        fire_effect.update_power(power)

    elif Input.is_action_pressed('down'):
        power -= POWER_SPEED
        power = clamp(power, 0, 1000)
        fire_effect.update_power(power)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("launch"):
        spawn_rocket()

func spawn_rocket():
    var astronaut = preload("res://actors/astronaut.tscn").instantiate()
    get_parent().add_child(astronaut)
    astronaut.global_position = self.global_position

    var impulse := power*Vector2.ONE.rotated(cannon.rotation + CANNON_INITIAL_ROTATION)
    astronaut.apply_central_impulse(impulse)
