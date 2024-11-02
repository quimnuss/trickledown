extends Node2D

const POWER_STEP := 100
const POWER_SUBSTEP := 25

var current_level := 0

@export var fire_sprites : Array[Sprite2D]

func update_power(power : int):
    var level = power / POWER_STEP
    var sublevel = (power % POWER_STEP) / POWER_SUBSTEP
    if level != current_level and level < 4:
        current_level = level

        for sp in fire_sprites:
            sp.visible = false

        for i in range(0, level):
            fire_sprites[i].visible = true
            fire_sprites[i].frame = 0

        fire_sprites[level].frame = clamp(4 - sublevel,0,3)
