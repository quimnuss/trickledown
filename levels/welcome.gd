extends Control

@onready var tab_bar: TabBar = %TabBar

func _ready():
    var language_id : int = Config.langs.find(Config.lang)
    tab_bar.set_current_tab(language_id)


func _on_start_button_pressed():
    get_tree().change_scene_to_file("res://levels/universe.tscn")


func _on_new_game_button_pressed() -> void:
    if ResourceLoader.exists(Config.save_path):
        var current_save : SaveResource = SaveResource.new()
        current_save = load(Config.save_path)
        current_save.reset()
        current_save.save()
        _on_start_button_pressed()


func _on_tab_bar_tab_selected(tab: int) -> void:
    Config.change_language(tab)
