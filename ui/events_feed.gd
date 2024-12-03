extends Control

@onready var feed: Feed = $Feed

var save_resource : SaveResource

var previous_richmen_num : int = 0

func _ready() -> void:
    save_resource = load(Config.save_path)
    save_resource.changed.connect(_on_richmen_status_changed)
    previous_richmen_num = save_resource.num_richmen

func _on_richmen_status_changed():
    if save_resource.num_richmen != previous_richmen_num:
        if save_resource.num_richmen > previous_richmen_num:
            feed.pop_filtered_news({'karma': [EventsReader.Karma.BAD, EventsReader.Karma.NEUTRAL]})
        elif save_resource.num_richmen < previous_richmen_num:
            feed.pop_filtered_news({'karma': [EventsReader.Karma.GOOD, EventsReader.Karma.NEUTRAL]})

        previous_richmen_num = save_resource.num_richmen
    
    


func _on_hide_feed_pressed() -> void:
    feed.visible = !feed.visible
