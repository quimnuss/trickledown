extends Node
class_name AstronautController

var FULL_POWER : float = 0.5

var DELTA_ROTATE : float = 0.1

signal burning(thrust_direction : Vector2)

var last_impulse_direction : Vector2


func _process(_delta: float) -> void:
    if Config.is_two_axis:
        var impulse_amount : float = Input.get_axis("down", "up")
        var impulse_direction : Vector2 = impulse_amount * Vector2.RIGHT
        if last_impulse_direction != impulse_direction:
            last_impulse_direction = impulse_direction
            burning.emit(impulse_direction)
    else:
        var impulse_direction : Vector2 = Input.get_vector("left", "right", "up", "down")
        if last_impulse_direction != impulse_direction:
            last_impulse_direction = impulse_direction
            burning.emit(impulse_direction)


func _physics_process(_delta: float) -> void:
    if Config.is_two_axis:
        two_axis_movement(_delta)
    else:
        eight_way_movement(_delta)


func eight_way_movement(_delta : float) -> void:
    var impulse_direction : Vector2 = Input.get_vector("left", "right", "up", "down")
    var impulse : Vector2 = impulse_direction * FULL_POWER
    var astronaut : Astronaut = get_parent()
    if impulse != Vector2.ZERO:
        astronaut.apply_central_impulse(impulse.rotated(astronaut.rotation))


func two_axis_movement(_delta: float) -> void:
    var impulse_direction : float = Input.get_axis("down", "up")
    var impulse : Vector2 = impulse_direction * FULL_POWER * Vector2.RIGHT
    var astronaut : Astronaut = get_parent()
    if Input.is_action_pressed("left"):
        astronaut.rotate(DELTA_ROTATE)
    elif Input.is_action_pressed("right"):
        astronaut.rotate(-DELTA_ROTATE)
    
    if impulse != Vector2.ZERO:
        astronaut.apply_central_impulse(impulse.rotated(astronaut.rotation))


func possess():
    set_process(true)
    set_physics_process(true)


func dispossess():
    set_process(false)
    set_physics_process(false)
