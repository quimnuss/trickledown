extends CanvasLayer

@onready var celestial_name: Label = $CelestialName

func _on_system_interaction_celestial_focus_changed(celestial: Node2D) -> void:
    celestial_name.text = celestial.name
