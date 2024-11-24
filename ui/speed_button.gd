extends Button

const TIME_WARP_DELTA : float = 0.2

@export var time_warp_icons : Array[CompressedTexture2D] = []

func _ready():
    set_time_warp(Engine.time_scale)

func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT:
            set_time_warp(clamp(Engine.time_scale + TIME_WARP_DELTA,0,2))
        elif event.button_index == MOUSE_BUTTON_RIGHT:
            set_time_warp(clamp(Engine.time_scale - TIME_WARP_DELTA,0,2))

func set_time_warp(new_time_warp : float):
    Engine.time_scale = new_time_warp
    var icon_step := int(new_time_warp*5.0/2)
    self.icon = time_warp_icons[icon_step]
