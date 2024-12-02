extends Sprite2D
class_name LoopingSprite

@export var fps : float = 5.0
# change if there are empty frames
@export var num_frames : int = self.hframes*self.vframes-1
@export var delay : int = 2

var tween : Tween

func _ready() -> void:
    var duration : float = max(num_frames/fps, 0.1)
    tween = create_tween().set_loops()
    tween.tween_property(self, "frame", num_frames, duration).from(0)
    tween.tween_interval(randf() * delay/4 + delay)

func restart() -> void:
    tween.stop()
    tween.play()
    
func stop() -> void:
    tween.stop()
