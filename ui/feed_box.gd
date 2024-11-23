extends Label
class_name FeedBox

@export var good_color : Color = Color(0.4, 0.9, 0.6)
@export var bad_color : Color = Color(0.9, 0.2, 0.2)
@export var neutral_color : Color = Color(0.4, 0.6, 0.9)


func _ready() -> void:
    var tween := create_tween()
    tween.tween_property(self, 'modulate:a', 1, 2).from(0)
    tween.tween_property(self, 'modulate:a', 0, 2).set_delay(10)
    tween.tween_callback(queue_free)


static func Instantiate(content : String, karma : int, richmen : String = "", title : String = ""):
    var feed_box : FeedBox = preload("res://ui/feed_box.tscn").instantiate()
    match karma:
        EventsReader.Karma.GOOD:
            pass
    feed_box.text = content
    return feed_box
