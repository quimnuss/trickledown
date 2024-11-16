extends Area2D
class_name Killzone

signal killzone_kill

func _on_body_entered(body: Node2D) -> void:
    if body is Astronaut:
        var astronaut := body as Astronaut
        astronaut.kill()
        killzone_kill.emit()
