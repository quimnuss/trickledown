extends Control
@onready var planet : Control = $AnimatedPlanet

@export var planet_pixels : int = 100

func _ready() -> void:
    planet.set_pixels(planet_pixels)
