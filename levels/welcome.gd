extends Control

@onready var tab_bar: TabBar = %TabBar

func _ready():
    var language_id : int = Config.langs.find(Config.lang)
    tab_bar.set_current_tab(language_id)
    if ResourceLoader.exists(Config.save_path):
        var current_save : SaveResource = load(Config.save_path)
        if current_save.save_version != SaveResource.LATEST_SAVE_VERSION:
            print("Savegame version mismatch. RESETING SAVE. Sorry, we're prototyping the game.")
            current_save.reset()
            current_save.save()
    else:
        create_first_time_save()

func _on_start_button_pressed():
    get_tree().change_scene_to_file("res://levels/universe.tscn")

func create_first_time_save():
    var current_save : SaveResource = SaveResource.new()
    current_save.reset()
    current_save.take_over_path(Config.save_path)
    current_save.save()

func _on_new_game_button_pressed() -> void:
    if ResourceLoader.exists(Config.save_path):
        var current_save : SaveResource = load(Config.save_path)
        current_save.reset()
        current_save.save()
        _on_start_button_pressed()
    else:
        create_first_time_save()


func _on_tab_bar_tab_selected(tab: int) -> void:
    Config.change_language(tab)
