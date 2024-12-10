extends Button

const TIME_WARPS : Array[float] = [0.0, 0.5, 1.0, 2.0, 10.0, 20.0]
var time_warp_index : int = 2

@export var time_warp_icons : Array[CompressedTexture2D] = []


func _ready():
    set_time_warp(time_warp_index)


func _gui_input(event: InputEvent) -> void:
    if event is InputEventMouseButton and event.pressed:
        if event.button_index == MOUSE_BUTTON_LEFT:
            time_warp_index = clamp(time_warp_index+1, 0, len(TIME_WARPS)-1)
            set_time_warp(time_warp_index)
        elif event.button_index == MOUSE_BUTTON_RIGHT:
            time_warp_index = clamp(time_warp_index-1, 0, len(TIME_WARPS)-1)
            set_time_warp(time_warp_index)


func set_time_warp(time_warp_index : int):
    Engine.time_scale = TIME_WARPS[time_warp_index]
    self.icon = time_warp_icons[time_warp_index]
