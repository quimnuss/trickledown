extends Node

@onready var save_manager: SaveManager = $SaveManager
@onready var stonks_value: Label = $StonksValue
@onready var richmen: Label = $Richmen
@onready var stonks_label: Label = $StonksLabel

@onready var shake_component: ShakeComponent = $Richmen/ShakeComponent

func _ready() -> void:
    save_manager.current_save.changed.connect(_on_stonks_changed)
    _on_stonks_changed()

func _on_classify_pressed() -> void:
    save_manager.current_save.increase_stonks()

func _on_stonks_changed():
    stonks_value.text = str(save_manager.current_save.stonks)
    stonks_label.text = tr('stonks').format({'stonks': save_manager.current_save.stonks})
    var richmen_text : String = tr("richmen").format({"num_richmen": save_manager.current_save.num_richmen})
    if richmen.text != richmen_text:
        shake_component._on_trigger_shake()
    richmen.text = tr("richmen").format({"num_richmen": save_manager.current_save.num_richmen})
