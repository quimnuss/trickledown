extends Area2D

signal milestone_completed(milestone_enum : Singleton.Milestone)


func _ready() -> void:
    add_to_group("milestoners")


func _on_body_exited(body: Node2D) -> void:
    if body is Astronaut and not body.is_queued_for_deletion():
        milestone_completed.emit(Singleton.Milestone.LAUNCH_ATMOSPHERE)
        queue_free()
