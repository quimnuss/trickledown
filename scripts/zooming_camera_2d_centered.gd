extends Camera2D
class_name ZoomingCamera2DCentered

@export var min_zoom := 0.3
@export var max_zoom := 10.0
@export var zoom_factor := 0.07
@export var zoom_duration := 0.2

@onready var home_planet: Node2D = %HomePlanet

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
    if event.is_action_pressed("zoom_out"):
        _set_zoom_level(_zoom_level + zoom_factor)


func detach():
    Singleton.focused_body = home_planet

    # TODO use the singleton signal to reparent etc.

    self.position_smoothing_enabled = false
    
    var tomb : Node2D = Marker2D.new()
    home_planet.add_child(tomb)
    tomb.global_position = self.global_position
    reparent(tomb, true)
    
    await get_tree().create_timer(3).timeout
    reparent(home_planet, true)
    self.position = Vector2.ZERO
    await get_tree().create_timer(0.5).timeout
    self.position_smoothing_enabled = true

    tomb.queue_free()


func detach_quickly():
    Singleton.focused_body = home_planet

    # TODO use the singleton signal to reparent etc.

    self.position_smoothing_enabled = false
    reparent(home_planet, false)
    self.position = Vector2.ZERO
    await get_tree().create_timer(0.3).timeout
    self.position_smoothing_enabled = true


#func _process(_delta):
    #self.global_position = self.get_global_mouse_position()
