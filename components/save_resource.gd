extends Node
class_name SaveManager
var current_save : SaveResource = SaveResource.new()


signal changed

func _ready() -> void:
    if ResourceLoader.exists(Config.save_path):
        current_save = load(Config.save_path)
        if OS.is_debug_build() and Singleton.do_reset:
            Singleton.do_reset = false
            current_save.reset()
    else:
        save()
    current_save.changed.connect(_rethrow_changed)
    current_save.emit_changed()

func _rethrow_changed():
    changed.emit()

func save():
    var error := ResourceSaver.save(current_save, Config.save_path)
    if error:
        print("An error happened while saving data: ", error)
