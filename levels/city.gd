extends Node

signal change_scene(scene : Singleton.Scene)


func _on_to_work_button_pressed() -> void:
    change_scene.emit(Singleton.Scene.WORK)



func _on_to_system_button_pressed() -> void:
    change_scene.emit(Singleton.Scene.SYSTEM)
