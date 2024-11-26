extends HBoxContainer

@export var portraits : Array[Texture]

var orbit_richmen : Array[RichmanData]

func update_orbit_portraits(updated_orbit_richmen : Array[RichmanData]):
    for richman in updated_orbit_richmen:
        if richman not in orbit_richmen:
            send_richmen_to_orbit(richman)
    for richman in orbit_richmen:
        if richman not in updated_orbit_richmen:
            kill_richmen(richman)

    orbit_richmen = updated_orbit_richmen.duplicate()

func send_richmen_to_orbit(richman_data : RichmanData):

    var richmen = get_tree().get_nodes_in_group('richmen')
    var richman_by_id : Astronaut
    # TODO use find
    for richman in richmen:
        if richman == richman_data:
            richman_by_id = richman


    var portrait : Button = preload('res://ui/orbit_portrait.tscn').instantiate()
    portrait.icon = richman_data.img
    portrait.gui_input.connect(richman_by_id._on_portrait_gui_input)
    self.add_child(portrait)

    #var portrait : TextureRect = TextureRect.new()
    #portrait.texture = portraits[richmen_id % len(portraits)]
    #portrait.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
    #portrait.custom_minimum_size = Vector2(60,80)
    #self.add_child(portrait)

func kill_richmen(richman : RichmanData):
    var video := VideoStreamPlayer.new()
    video.autoplay = true
    # TODO switch to signals for killing portraits and specify reason
    video.stream = preload("res://assets/astronaut_death.ogv")
    #add_child(video) # using replace by instead
    video.finished.connect(video.queue_free)
    for child in self.get_children():
        if child is Button:
            if child.texture == richman.img:
                child.replace_by(video)
                child.queue_free()
                break
