extends Node

const SAVEFILE = "user://trickledown.cfg"

var skip_tutorial : bool = false

var config = ConfigFile.new()

func _ready():
    var err = config.load(SAVEFILE)
    if err != OK:
        config_init()
    load_config()
    show_config()


func config_init():
    config.set_value("preferences", "skip_tutorial", false)
    config.save(SAVEFILE)


func load_config():
    skip_tutorial = config.get_value("preferences", "skip_tutorial", skip_tutorial)

func save():
    config.save(SAVEFILE)

func show_config():
    prints('config', SAVEFILE, ':\nskip_tutorial', skip_tutorial)
