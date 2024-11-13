extends TextureButton

var elapsed : float = 0

func _process(delta):
    elapsed += delta
    if elapsed > 0.5:
        elapsed = 0
        self.button_pressed = not self.button_pressed
        
