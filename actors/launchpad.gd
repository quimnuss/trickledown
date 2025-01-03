extends Node2D

@onready var cannon: Sprite2D = $Cannon
@onready var fire_effect: Node2D = $Cannon/FireEffect
@onready var marker_2d: Marker2D = $Marker2D
@onready var save_manager: SaveManager = $SaveManager
@onready var rocket_launch_sound: AudioStreamPlayer2D = $RocketLaunchSound

var ROTATION_SPEED := 0.1*PI
var POWER_SPEED := 5

var power := 50

const CANNON_INITIAL_ROTATION := PI/2 + PI/2 + PI/4

signal rocket_spawned(richman_data : RichmanData)

signal richmen_launched(astronaut : Astronaut)

signal milestone_completed(milestone_enum : Singleton.Milestone)

func _ready() -> void:
    add_to_group('milestoners')

func _process(delta: float) -> void:
    if Input.is_action_pressed('right'):
        cannon.rotation += ROTATION_SPEED*delta
    elif Input.is_action_pressed('left'):
        cannon.rotation -= ROTATION_SPEED*delta
    cannon.rotation = clamp(cannon.rotation, -0.55*PI, 0.55*PI)

    if Input.is_action_pressed('up'):
        power += POWER_SPEED
        power = clamp(power, 0, 150)
        fire_effect.update_power(power)

    elif Input.is_action_pressed('down'):
        power -= POWER_SPEED
        power = clamp(power, 0, 150)
        fire_effect.update_power(power)

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("launch"):
        if save_manager.current_save.num_richmen > 0:
            spawn_rocket()


func spawn_rocket():
    var astronaut : Astronaut = preload("res://actors/astronaut.tscn").instantiate()
    var current_save : SaveResource = save_manager.current_save
    astronaut.richman_data = current_save.launchpad_richman
    assert(is_instance_valid(current_save.launchpad_richman))
    astronaut.death.connect(current_save.death)
    get_parent().add_child(astronaut)
    astronaut.global_position = marker_2d.global_position

    var impulse := power*Vector2.ONE.rotated(cannon.rotation + CANNON_INITIAL_ROTATION)
    astronaut.apply_central_impulse(impulse)
    Singleton.focused_body = astronaut
    astronaut.focus()
    rocket_spawned.emit(save_manager.current_save.launchpad_richman)
    richmen_launched.emit(astronaut)
    save_manager.current_save.rotate_richmen()
    save_manager.current_save.num_richmen -= 1
    save_manager.save()
    save_manager.current_save.emit_changed()

    milestone_completed.emit(Singleton.Milestone.LAUNCH)
    rocket_launch_sound.play()
    EventBus.shake.emit()
    


func _on_visibility_changed() -> void:
    var scene_visible : bool = is_visible_in_tree()
    set_process(scene_visible)
    set_process_input(scene_visible)


func _on_trickle_down_pressed() -> void:
    if save_manager.current_save.num_richmen > 0:
        spawn_rocket()
