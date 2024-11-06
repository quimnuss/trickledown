extends Node
class_name SaveManager
var current_save : SaveResource = SaveResource.new()

# TODO add savegame filepath to config
var save_path : String = "user://player_data.tres"

signal changed

func _ready() -> void:
    if ResourceLoader.exists(save_path):
        current_save = load(save_path)
    else:
        save()
    current_save.changed.connect(_rethrow_changed)
    current_save.emit_changed()

func _rethrow_changed():
    changed.emit()

func save():
    var error := ResourceSaver.save(current_save, save_path)
    if error:
        print("An error happened while saving data: ", error)

func update_stonks(stonks, num_richmen):
    current_save.num_richmen = num_richmen
    current_save.stonks = stonks
    save()
    current_save.emit_changed()
