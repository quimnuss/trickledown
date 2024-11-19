extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_astronaut_controller_burning(thrust_percent: float) -> void:
    if thrust_percent != 0 and not self.playing:
        self.play()
    else:
        self.stop()
