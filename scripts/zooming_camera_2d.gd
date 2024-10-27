extends Camera2D
class_name ZoomingCamera2D

@export var min_zoom := 0.7
@export var max_zoom := 3.0
@export var zoom_factor := 0.07
@export var zoom_duration := 0.2

var _zoom_level := 1.0

func _set_zoom_level(value: float) -> void:
    _zoom_level = clamp(value, min_zoom, max_zoom)
    var tween : Tween = get_tree().create_tween()
    tween.tween_property(self, "zoom", Vector2(value, value), zoom_duration).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
    tween.play()

func _follow_mouse() -> void:
    var tween : Tween = get_tree().create_tween()
    tween.tween_property(self, "position", self.get_global_mouse_position(), zoom_duration).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
    tween.play() 

func _unhandled_input(event):
    if event.is_action_pressed("zoom_in"):
        _set_zoom_level(_zoom_level - zoom_factor)
        _follow_mouse()
    if event.is_action_pressed("zoom_out"):
        _set_zoom_level(_zoom_level + zoom_factor)

#func _process(_delta):
    #self.global_position = self.get_global_mouse_position()
