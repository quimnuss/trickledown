extends CanvasLayer

signal change_scene(scene : Singleton.Scene)


func _on_to_city_pressed() -> void:
    change_scene.emit(Singleton.Scene.CITY)


func _on_to_system_pressed() -> void:
    change_scene.emit(Singleton.Scene.SYSTEM)
