extends CanvasLayer

@onready var celestial_name: Label = $CelestialName
@onready var save_manager: SaveManager = $SaveManager
@onready var richmen_count: Label = %RichmenCount
@onready var richmen_portrait: Sprite2D = $VBoxContainer/HBoxContainer/RichmenPortrait
@onready var orbit_container: HBoxContainer = $OrbitContainer

func _ready():
    save_manager.changed.connect(_on_save_changed)
    _on_save_changed()

func _on_system_interaction_celestial_focus_changed(celestial: Node2D) -> void:
    celestial_name.text = celestial.name

func _on_save_changed():
    richmen_count.text = '%d richmen' % save_manager.current_save.num_richmen
    richmen_portrait.frame = save_manager.current_save.richmen_launchpad % (richmen_portrait.hframes*richmen_portrait.vframes)
    orbit_container.update_orbit_portraits(save_manager.current_save.richmen_orbit)
