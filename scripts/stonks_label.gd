extends Node

@onready var save_manager: SaveManager = $SaveManager
@onready var stonks_value: Label = $StonksValue
@onready var richmen: Label = $Richmen
@onready var stonks_label: Label = $StonksLabel

var work_stonks_delta : int = 1000
var richmen_threshold : int = 10000

func _ready() -> void:
    save_manager.current_save.changed.connect(_on_stonks_changed)
    _on_stonks_changed()

func _on_classify_pressed() -> void:
    save_manager.current_save.increase_stonks()

func _on_stonks_changed():
    stonks_value.text = str(save_manager.current_save.stonks)
    stonks_label.text = tr('stonks').format({'stonks': save_manager.current_save.stonks})
    richmen.text = tr("richmen").format({"num_richmen": save_manager.current_save.num_richmen})
