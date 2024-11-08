extends Node

@onready var save_manager: SaveManager = $SaveManager
@onready var stonks_value: Label = $StonksValue
@onready var richmen: Label = $Richmen

var work_stonks_delta : int = 1000
var richmen_threshold : int = 10000

func _ready() -> void:
    save_manager.changed.connect(_on_stonks_changed)
    _on_stonks_changed()

func _on_classify_pressed() -> void:
    var stonks : int = save_manager.current_save.stonks + work_stonks_delta
    @warning_ignore("integer_division")
    var num_richmen : int = save_manager.current_save.num_richmen + stonks / richmen_threshold
    stonks = stonks % richmen_threshold
    save_manager.update_stonks(stonks, num_richmen)

func _on_stonks_changed():
    stonks_value.text = str(save_manager.current_save.stonks)
    richmen.text = "%d richmen" % save_manager.current_save.num_richmen
