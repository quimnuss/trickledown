extends Area2D

@export var milestone : Singleton.Milestone

signal milestone_completed(milestone_enum : Singleton.Milestone)

func _ready() -> void:
    add_to_group('milestoners')

func _on_body_entered(body: Node2D) -> void:
    if body is Astronaut:
        var astronaut : Astronaut = body as Astronaut
        astronaut.kill()
        var blood_spat = preload("res://actors/effects/blood_spat.tscn").instantiate()
        add_child(blood_spat)
        blood_spat.global_position = body.global_position
        blood_spat.look_at(self.get_parent().global_position)
        milestone_completed.emit(milestone)
