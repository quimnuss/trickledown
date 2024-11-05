extends Node

var current_save : SaveResource = SaveResource.new()

# TODO add savegame filepath to config
var save_path : String = "user://player_data.tres"

var work_stonks_delta : int = 1000
var richmen_threshold : int = 10000

@onready var stonks_value: Label = $StonksValue
@onready var richmen: Label = $Richmen

func _ready() -> void:
    if ResourceLoader.exists(save_path):
        current_save = load(save_path)
    else:
        save()
    _on_stonks_changed()
    current_save.changed.connect(_on_stonks_changed)

func save():
    var error := ResourceSaver.save(current_save, save_path)
    if error:
        print("An error happened while saving data: ", error)

func _on_classify_pressed() -> void:
    current_save.stonks += work_stonks_delta
    @warning_ignore("integer_division")
    current_save.num_richmen += current_save.stonks / richmen_threshold
    current_save.stonks = current_save.stonks % richmen_threshold
    save()
    current_save.emit_changed()

func _on_stonks_changed():
    stonks_value.text = str(current_save.stonks)
    richmen.text = "%d richment" % current_save.num_richmen
