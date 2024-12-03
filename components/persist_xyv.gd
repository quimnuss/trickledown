extends Node


func save_data() -> Dictionary:
    var papa : Node2D = get_parent()
    var save_dict = {
        "filename" : papa.get_scene_file_path(),
        "parent" : papa.get_parent().get_path(),
        "position.x" : papa.global_position.x,
        "position.y" : papa.global_position.y,
        "velocity.x" : papa.velocity.x,
        "velocity.y" : papa.velocity.y
    }
    return save_dict
