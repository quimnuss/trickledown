extends Node2D


func _ready() -> void:
    var tween : Tween = create_tween().set_loops()
    tween.tween_property(self, "rotation", 2*PI, 3).from(0)
