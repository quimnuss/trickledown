extends CharacterBody2D

const PLAYER_SPEED : float = 10
const PLAYER_JUMP_HEIGHT : float = 10
const PLAYER_ROTATION_SPEED : float = 1

var gravity_velocity : Vector2
var player_input_velocity : Vector2


func _ready():
    velocity = Vector2.RIGHT*1000

func _physics_process(delta):
    # add all gravity of all planets together
    var gravity := Vector2.ZERO
    for gravity_component in get_tree().get_nodes_in_group('gravity_component'):
        gravity += gravity_component.get_gravity_at(global_position)
    gravity_velocity += gravity * delta

    # rotate the player according to the gravity
    var gravity_angle = gravity.angle() - PI/2
    global_rotation = lerp_angle(global_rotation, gravity_angle, delta * PLAYER_ROTATION_SPEED)

    player_input_velocity = Vector2(Input.get_axis("left", "right"), 0).normalized() * PLAYER_SPEED
    if Input.is_action_just_pressed("jump"):
        player_input_velocity.y = -sqrt(PLAYER_JUMP_HEIGHT * 2 * gravity.length())

    # rotate the input velocity to match player rotation
    player_input_velocity = player_input_velocity.rotated(rotation)

    # add velocities
    velocity = gravity_velocity + player_input_velocity

    move_and_slide()
