extends CanvasLayer

@onready var celestial_name: Label = $CelestialName
@onready var save_manager: SaveManager = $SaveManager
@onready var richmen_count: Label = %RichmenCount
@onready var richmen_portrait: OrbitPortrait = $VBoxContainer/HBoxContainer/RichmenPortrait
@onready var orbit_container: HBoxContainer = $OrbitContainer

func _ready():
    save_manager.changed.connect(_on_save_changed)
    _on_save_changed()
    Singleton.focused_body_changed.connect(_on_system_interaction_celestial_focus_changed)

func _on_system_interaction_celestial_focus_changed() -> void:
    celestial_name.text = tr(Singleton.focused_body.name)

func _on_save_changed():
    richmen_count.text = tr('richmen').format({'num_richmen':save_manager.current_save.num_richmen})
    if save_manager.current_save.launchpad_richman:
        richmen_portrait.richman_data = save_manager.current_save.launchpad_richman
        richmen_portrait.refresh()
    richmen_portrait.visible = save_manager.current_save.num_richmen > 0
    orbit_container.update_orbit_portraits(save_manager.current_save.richmen_orbit)


func _on_quit_button_pressed():
    get_tree().quit()
