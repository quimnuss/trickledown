extends AudioStreamPlayer2D


func _on_astronaut_controller_burning(thrust_direction: Vector2) -> void:
    if thrust_direction.length_squared() > 0 and not self.playing:
        self.play()
    elif thrust_direction.length_squared() == 0:
        self.stop()
