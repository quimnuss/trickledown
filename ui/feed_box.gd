extends Label
class_name FeedBox

@export var good_color : Color = Color(0.25, 0.6, 0.4)
@export var bad_color : Color = Color(0.9, 0.2, 0.2)
@export var neutral_color : Color = Color(0.4, 0.6, 0.9)

var bad_karma_stylebox : StyleBoxFlat


func _ready() -> void:
    
    var tween := create_tween()
    tween.tween_property(self, 'modulate:a', 1, 2).from(0)
    tween.tween_property(self, 'modulate:a', 0, 2).set_delay(7)
    tween.tween_callback(queue_free)

func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
        self.queue_free()


static func Instantiate(content : String, karma : int, richmen : String = "", title : String = ""):
    var feed_box : FeedBox = preload("res://ui/feed_box.tscn").instantiate()
    var karma_stylebox : StyleBoxFlat = feed_box.get_theme_stylebox('normal').duplicate()
    match karma:
        EventsReader.Karma.BAD:
            karma_stylebox.bg_color = Color(0.9, 0.2, 0.2)
            feed_box.add_theme_stylebox_override("normal", karma_stylebox)
        EventsReader.Karma.GOOD:
            karma_stylebox.bg_color = Color(0.25, 0.6, 0.4)
            feed_box.add_theme_stylebox_override("normal", karma_stylebox)
    feed_box.text = content
    return feed_box
