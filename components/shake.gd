extends Control
class_name Shake

var max_shake = 20.0

var tween : Tween

@export var num_loops : int = 4

var original_position : Vector2

func _ready():
    tween = create_tween().set_loops(num_loops)
    tween.finished.connect(_on_tween_completed)
    original_position = self.position
    start_tween()

func start_tween():
    tween.tween_property(get_parent(), "position:y", original_position.y + max_shake, 0.5)
    tween.tween_property(get_parent(), "position:y", original_position.y, 0.5)

func stop_tween():
    tween.stop()

func _on_tween_completed():
    pass
    start_tween()
