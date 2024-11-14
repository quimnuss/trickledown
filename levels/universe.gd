extends Node2D
@onready var work_canvas_layer: CanvasLayer = $WorkCanvasLayer
@onready var planetary_canvas_layer: CanvasLayer = $PlanetaryCanvasLayer
@onready var city_canvas_layer: CanvasLayer = $City

@onready var planetary_system_ui: CanvasLayer = $PlanetaryCanvasLayer/PlanetarySystem/UI

func _ready():
    if not Config.skip_tutorial:
        var tutorial := preload("res://levels/tutorial.tscn").instantiate()
        #tutorial_canvas.add_child(tutorial)
        self.add_child(tutorial)

func _on_change_scene(scene: Singleton.Scene) -> void:
    #var scene_enum : Singleton.Scene = scene as Singleton.Scene
    work_canvas_layer.visible = false
    planetary_canvas_layer.visible = false
    planetary_system_ui.visible = false
    city_canvas_layer.visible = false
    match scene:
        Singleton.Scene.CITY:
            city_canvas_layer.visible = true
        Singleton.Scene.WORK:
            work_canvas_layer.visible = true
        Singleton.Scene.SYSTEM:
            planetary_canvas_layer.visible = true
            planetary_system_ui.visible = true
        _:
            planetary_canvas_layer.visible = true
            planetary_system_ui.visible = true
