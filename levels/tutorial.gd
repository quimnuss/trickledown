extends Node


func _on_skip_button_pressed():
    Config.skip_tutorial = true
    Config.save()
    queue_free()
