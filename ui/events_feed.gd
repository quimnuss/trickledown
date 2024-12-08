extends Control

@onready var feed: Feed = $Feed

var save_resource : SaveResource

var previous_richmen_num : int = 0

@onready var hide_feed : Button = $HideFeed

func _ready() -> void:
    save_resource = load(Config.save_path)
    save_resource.changed.connect(_on_richmen_status_changed)
    previous_richmen_num = save_resource.num_richmen


func _on_richmen_status_changed():
    if save_resource.num_richmen != previous_richmen_num:
        if save_resource.num_richmen > previous_richmen_num:
            feed.pop_filtered_news({'karma': [EventsReader.Karma.BAD, EventsReader.Karma.NEUTRAL]})
            if hide_feed.pressed:
                highlight_feed(EventsReader.Karma.BAD)    
        elif save_resource.num_richmen < previous_richmen_num:
            feed.pop_filtered_news({'karma': [EventsReader.Karma.GOOD, EventsReader.Karma.NEUTRAL]})
            if hide_feed.pressed:
                highlight_feed(EventsReader.Karma.GOOD)    

        previous_richmen_num = save_resource.num_richmen


func highlight_feed(karma : EventsReader.Karma):
    var original_modulate = hide_feed.modulate
    var high_color : Color = Color.FIREBRICK if karma == EventsReader.Karma.BAD else Color.LIGHT_GREEN
    var tween : Tween = get_tree().create_tween()
    const NUM_OSCILLATIONS : int = 3
    for i in range(NUM_OSCILLATIONS):
        tween.tween_property(hide_feed, "modulate", high_color, 0.4)
        tween.tween_property(hide_feed, "modulate", Color.BLACK, 0.4)
    tween.tween_property(hide_feed, "modulate", original_modulate, 0.4)


func _on_hide_feed_pressed() -> void:
    feed.visible = !feed.visible
