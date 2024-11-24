extends AudioStreamPlayer2D


func _on_astronaut_controller_burning(thrust_percent: float) -> void:
    if thrust_percent != 0 and not self.playing:
        self.play()
    else:
        self.stop()
