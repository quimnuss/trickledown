extends Area2D
class_name OrbitMilestoneChecker

var orbiting_astronaut : Astronaut

var total_angle : float = 0

@export var milestone_type : Singleton.Milestone = Singleton.Milestone.ORBIT_STABLE

signal milestone_completed(milestone_enum : Singleton.Milestone)

var last_astronaut_to_body : Vector2 = Vector2.ZERO

var completed : bool = false


func _ready():
    add_to_group('milestoners')
    self.body_entered.connect(_on_body_entered)
    self.body_exited.connect(_on_body_exited)

func _physics_process(delta: float) -> void:
    if completed:
        return
    if orbiting_astronaut:
        update_angle()

func update_angle():
    var astronaut_to_body : Vector2 = orbiting_astronaut.global_position - self.global_position
    
    if last_astronaut_to_body == Vector2.ZERO:
        last_astronaut_to_body = astronaut_to_body
        return
    
    var da = last_astronaut_to_body.angle_to(astronaut_to_body)
    if is_zero_approx(da):
        return
    
    if not is_zero_approx(total_angle) and sign(da) != sign(total_angle):
        # changed direction
        total_angle = 0
    
    total_angle += da
    last_astronaut_to_body = astronaut_to_body
    
    if abs(total_angle) >= 2*PI:
        milestone_completed.emit(milestone_type)
        completed = true
        #self.queue_free()
    

func reset():
    orbiting_astronaut = null
    total_angle = 0
    last_astronaut_to_body = Vector2.ZERO

func _on_body_entered(body: Node2D) -> void:
    if body is Astronaut:
        last_astronaut_to_body = body.global_position - self.global_position
        orbiting_astronaut = body
        if milestone_type == Singleton.Milestone.ORBIT_STABLE:
            orbiting_astronaut.astronaut_controller.burning.connect(_on_astronaut_thrusted)

func _on_body_exited(body: Node2D) -> void:
    if body is Astronaut:
        if milestone_type == Singleton.Milestone.ORBIT_STABLE:
            if body.astronaut_controller.burning.is_connected(_on_astronaut_thrusted):
                body.astronaut_controller.burning.disconnect(_on_astronaut_thrusted)
        reset()

func _on_astronaut_thrusted(_amount : float):
    total_angle = 0
    if orbiting_astronaut:
        last_astronaut_to_body = orbiting_astronaut.global_position - self.global_position
    else: # should never happen
        last_astronaut_to_body = Vector2.ZERO
