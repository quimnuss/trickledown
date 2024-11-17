extends Area2D
class_name Killzone

signal killzone_kill

signal milestone_completed(milestone_enum : Singleton.Milestone)

func _ready():
    add_to_group('milestoners')

func _on_body_entered(body: Node2D) -> void:
    if body is Astronaut:
        var astronaut := body as Astronaut
        astronaut.kill()
        killzone_kill.emit()
        milestone_completed.emit(Singleton.Milestone.ESCAPE_VELOCITY)
