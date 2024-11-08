extends HBoxContainer

@export var portraits : Array[Texture]

var richmen_ids_graphical : Array[int]

func update_orbit_portraits(richmen_ids : Array[int]):
    for richmen_id in richmen_ids:
        if richmen_id not in richmen_ids_graphical:
            send_richmen_to_orbit(richmen_id)
    for richmen_id in richmen_ids_graphical:
        if richmen_id not in richmen_ids:
            kill_richmen(richmen_id)

    richmen_ids_graphical = richmen_ids.duplicate()

func send_richmen_to_orbit(richmen_id : int):
    var portrait : TextureRect = TextureRect.new()
    portrait.texture = portraits[richmen_id % len(portraits)]
    portrait.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
    portrait.custom_minimum_size = Vector2(60,80)
    self.add_child(portrait)

func kill_richmen(richmen_id):
    for child in self.get_children():
        if child is TextureRect:
            if child.texture == portraits[richmen_id % len(portraits)]:
                child.queue_free()
                break
    var video := VideoStreamPlayer.new()
    video.autoplay = true
    video.stream = preload("res://assets/astronaut_death.ogv")
    add_child(video)
    video.finished.connect(video.queue_free)
