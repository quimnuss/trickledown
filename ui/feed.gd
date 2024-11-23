extends VBoxContainer

@onready var feed_timer: Timer = $FeedTimer

@export var foo : int = 10

var events : Array[Dictionary] = []

func _ready() -> void:
    feed_timer.timeout.connect(pop_news)
    events = EventsReader.read_from_JSON("res://data/events.json")
    
func pop_news():
    if not events.is_empty():
        var event_data : Dictionary = events.pick_random()
        var richmen : String = event_data['richmen']
        var content : String = event_data['content']
        var karma : int = event_data['karma']
        var feed_box : FeedBox = FeedBox.Instantiate(content, karma, richmen)
        add_child(feed_box)
        events.erase(event_data)
