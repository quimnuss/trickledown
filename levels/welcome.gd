extends Control


func _on_start_button_pressed():
    get_tree().change_scene_to_file("res://levels/universe.tscn")


func _on_new_game_button_pressed() -> void:
    if ResourceLoader.exists(Config.save_path):
        var current_save : SaveResource = SaveResource.new()
        current_save = load(Config.save_path)
        current_save.reset()
        current_save.save()
        _on_start_button_pressed()
