extends Button

const MAX_TIME_WARP : float = 2.0
const NUM_ICON_STEPS : int = 5
const TIME_WARP_DELTA : float = MAX_TIME_WARP / float(NUM_ICON_STEPS)
const ICON_TIME_WARP_STEP : float = float(NUM_ICON_STEPS)/MAX_TIME_WARP

@export var time_warp_icons : Array[CompressedTexture2D] = []

func _ready():
    set_time_warp(Engine.time_scale)

func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
            set_time_warp(clamp(Engine.time_scale + TIME_WARP_DELTA,0,MAX_TIME_WARP))
        elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
            set_time_warp(clamp(Engine.time_scale - TIME_WARP_DELTA,0,MAX_TIME_WARP))

func set_time_warp(new_time_warp : float):
    Engine.time_scale = new_time_warp
    var icon_step := int(new_time_warp*ICON_TIME_WARP_STEP)
    self.icon = time_warp_icons[icon_step]
