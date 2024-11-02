extends Sprite2D

var tween : Tween

func _ready() -> void:
    tween = create_tween()
    tween.tween_property(self, 'frame', 5, 1)
    tween.tween_callback(queue_free)
