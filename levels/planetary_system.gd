extends Node2D

signal change_scene(scene : Singleton.Scene)


func _on_to_city_button_pressed() -> void:
    var scene_id : int = Singleton.Scene.CITY as int
    change_scene.emit(scene_id)


func _on_to_work_button_pressed() -> void:
    change_scene.emit(Singleton.Scene.WORK)
