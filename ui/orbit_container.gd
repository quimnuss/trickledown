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

    var richmens = get_tree().get_nodes_in_group('richmen')
    var richmen_by_id : Astronaut
    for richmen in richmens:
        if richmen.id == richmen_id:
            richmen_by_id = richmen


    var portrait : Button = preload('res://ui/orbit_portrait.tscn').instantiate()
    portrait.icon = portraits[richmen_id % len(portraits)]
    portrait.gui_input.connect(richmen_by_id._on_portrait_gui_input)
    self.add_child(portrait)

    #var portrait : TextureRect = TextureRect.new()
    #portrait.texture = portraits[richmen_id % len(portraits)]
    #portrait.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
    #portrait.custom_minimum_size = Vector2(60,80)
    #self.add_child(portrait)

func kill_richmen(richmen_id):
    var video := VideoStreamPlayer.new()
    video.autoplay = true
    # TODO switch to signals for killing portraits and specify reason
    video.stream = preload("res://assets/astronaut_death.ogv")
    #add_child(video) # using replace by instead
    video.finished.connect(video.queue_free)
    for child in self.get_children():
        if child is Button:
            if child.icon == portraits[richmen_id % len(portraits)]:
                child.replace_by(video)
                child.queue_free()
                break
