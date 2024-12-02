extends Node
class_name AstronautController

var impulse : Vector2 = Vector2.ZERO

var FULL_POWER : float = 0.5

var DELTA_ROTATE : float = 0.1

signal burning(thrust_percent : float)

func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("up"):
        impulse = Vector2.RIGHT*FULL_POWER
        burning.emit(1.0)
    elif Input.is_action_just_pressed("down"):
        impulse = Vector2.LEFT*FULL_POWER
        burning.emit(-1.0)
    elif Input.is_action_just_released("up") or Input.is_action_just_released("down"):
        impulse = Vector2.ZERO
        burning.emit(0.0)

func _physics_process(_delta: float) -> void:
    var astronaut : Astronaut = get_parent()
    if impulse != Vector2.ZERO:
        astronaut.apply_central_impulse(impulse.rotated(astronaut.rotation))
    if Input.is_action_pressed("left"):
        astronaut.rotate(DELTA_ROTATE)
    elif Input.is_action_pressed("right"):
        astronaut.rotate(-DELTA_ROTATE)


func possess():
    set_process(true)
    set_physics_process(true)

func dispossess():
    set_process(false)
    set_physics_process(false)
