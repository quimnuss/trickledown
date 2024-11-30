extends Sprite2D


@export var fps : float = 5.0
# change if there are empty frames
@export var num_frames : int = self.hframes*self.vframes-1

func _ready() -> void:
    var duration : float = max(num_frames/fps, 0.1)
    var tween : Tween = create_tween().set_loops()
    tween.tween_property(self, "frame", num_frames, num_frames/fps).from(0)
