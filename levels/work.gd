extends CanvasLayer



func _on_to_city_pressed() -> void:
    get_tree().change_scene_to_file("res://levels/city.tscn")


func _on_to_system_pressed() -> void:
    get_tree().change_scene_to_file("res://levels/planetary_system.tscn")
