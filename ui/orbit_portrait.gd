@tool
extends Button
class_name OrbitPortrait

@export var richman_data : RichmanData

@onready var astronaut_name = $AstronautName

func _ready():
    refresh()

func refresh():
    self.icon = richman_data.img
    self.astronaut_name.text = richman_data.name
    self.tooltip_text = richman_data.bio
