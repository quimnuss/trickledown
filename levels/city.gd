extends Node2D


func _on_to_work_button_pressed() -> void:
    get_tree().change_scene_to_file("res://levels/work.tscn")


func _on_to_system_button_pressed() -> void:
    get_tree().change_scene_to_file("res://levels/planetary_system.tscn")
