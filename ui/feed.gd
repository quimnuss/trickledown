extends VBoxContainer
class_name Feed

@onready var feed_timer: Timer = $FeedTimer

@export var events_file : String = "res://data/events.json"

var events : Array[Dictionary] = []

func _ready() -> void:
    feed_timer.timeout.connect(pop_news)
    events = EventsReader.read_from_JSON(events_file)
    

func pop_event(event_data : Dictionary):
    var richmen : String = event_data['richmen']
    var content : String = event_data['content'] if Config.lang == 'en' else event_data['content_' + Config.lang]
    var karma : int = event_data['karma']
    var feed_box : FeedBox = FeedBox.Instantiate(content, karma, richmen)
    add_child(feed_box)
    events.erase(event_data)

func pop_news():
    if not events.is_empty():
        var event_data : Dictionary = events.pick_random()
        pop_event(event_data)

static func _pop_random_filtered(events_list : Array[Dictionary], filter : Dictionary) -> Variant:
    for event in events_list:
        var event_karma : int = event['karma']
        var filter_karma : Array = filter['karma']
        if event_karma in filter_karma:
            events_list.erase(event)
            return event
    return null

func pop_filtered_news(filter : Dictionary):
    if events.is_empty():
        return

    var event_data : Variant = _pop_random_filtered(events, filter)
    if event_data:
        pop_event(event_data)
