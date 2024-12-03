extends Node2D

const POWER_STEP := 150/5
@warning_ignore("integer_division")
const POWER_SUBSTEP := 150/5/4

var current_level := 0
var current_sublevel := 0

@export var fire_sprites : Array[Sprite2D]


func update_power(power : int):
    @warning_ignore("integer_division")
    var level = power / POWER_STEP
    @warning_ignore("integer_division")
    var sublevel = (power % POWER_STEP) / POWER_SUBSTEP
    if level != current_level and level < 4:
        current_level = level

        for sp in fire_sprites:
            sp.visible = false

        for i in range(0, level):
            fire_sprites[i].visible = true
            fire_sprites[i].frame = 0

    if sublevel != current_sublevel and level < 4:
        fire_sprites[level].visible = true
        current_sublevel = sublevel
        fire_sprites[level].frame = clamp(4 - sublevel,0,3)
