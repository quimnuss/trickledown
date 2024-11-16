extends Area2D


func _on_body_entered(body: Node2D) -> void:
    if body is Astronaut:
        var astronaut : Astronaut = body as Astronaut
        astronaut.kill()
        var blood_spat = preload("res://actors/effects/blood_spat.tscn").instantiate()
        add_child(blood_spat)
        blood_spat.global_position = body.global_position
        blood_spat.look_at(self.get_parent().global_position)
