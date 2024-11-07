extends CanvasLayer

@onready var celestial_name: Label = $CelestialName
@onready var save_manager: SaveManager = $SaveManager
@onready var richmen_count: Label = %RichmenCount
@onready var richmen_portrait: Sprite2D = $VBoxContainer/HBoxContainer/RichmenPortrait

func _ready():
    save_manager.changed.connect(_on_save_changed)
    _on_save_changed()

func _on_system_interaction_celestial_focus_changed(celestial: Node2D) -> void:
    celestial_name.text = celestial.name

func _on_save_changed():
    richmen_count.text = '%d richmen' % save_manager.current_save.num_richmen
    richmen_portrait.frame = (richmen_portrait.frame + 1) % (richmen_portrait.hframes*richmen_portrait.vframes)
