extends Node

const SAVEFILE = "user://trickledown.cfg"
var save_path : String = "user://player_data.tres"

var skip_tutorial : bool = false
var lang : String = 'en'

var langs : Array[String] = ['en', 'ca']

var config = ConfigFile.new()


func _ready():
    var err = config.load(SAVEFILE)
    if err != OK:
        config_init()
    load_config()
    show_config()


func config_init():
    config.set_value("preferences", "skip_tutorial", false)
    config.set_value("preferences", "language", "en")
    config.save(SAVEFILE)


func load_config():
    skip_tutorial = config.get_value("preferences", "skip_tutorial", skip_tutorial)
    lang = config.get_value("preferences", "language", lang)


func save():
    config.set_value("preferences", "skip_tutorial", skip_tutorial)
    config.set_value("preferences", "language", lang)
    config.save(SAVEFILE)


func show_config():
    prints('config', SAVEFILE, ':\nskip_tutorial', skip_tutorial, 'language:', lang)
