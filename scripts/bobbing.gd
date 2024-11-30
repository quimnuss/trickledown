extends Sprite2D


func _ready() -> void:
    var duration := randf() * 3 + 1
    var start_position := self.global_position.y
    var tween := create_tween().set_loops()
    tween.tween_property(self, "global_position:y", start_position + 10, duration).set_trans(Tween.TRANS_SINE)
    tween.tween_property(self, "global_position:y", start_position, duration).set_trans(Tween.TRANS_SINE)
