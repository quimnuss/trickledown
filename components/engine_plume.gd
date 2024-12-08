extends Sprite2D

var thrust_tween : Tween

@export var direction : Vector2

func _ready() -> void:
    thrust_tween = create_tween().set_loops()
    thrust_tween.tween_property(self, 'frame', 12, 1).from(8)   

func _on_astronaut_controller_burning(thrust_direction : Vector2) -> void:
    var is_burning : bool = direction.dot(thrust_direction) > 0
    self.visible = is_burning
    if is_burning:
        thrust_tween.play()
    else:
        thrust_tween.stop()
