extends Sprite2D
class_name AnimatedSprite

@export var fps : float = 5.0
# change if there are empty frames
@export var num_frames : int = self.hframes*self.vframes-1
@export var delay : float = 2

func restart() -> void:
    self.frame = 0
    var duration : float = max(num_frames/fps, 0.1)
    var tween : Tween = get_tree().create_tween()
    tween.tween_property(self, "modulate:a", 1, 1).from(0)
    tween.tween_property(self, "frame", num_frames, duration).from(0).set_delay(delay)
    tween.tween_property(self, "modulate:a", 0, 1).set_delay(delay)
    tween.tween_callback(set_visible.bind(false)).set_delay(delay)
