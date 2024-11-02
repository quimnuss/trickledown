extends Node2D

const POWER_STEP := 10

var current_level := 0

var fire_sprites : Array[Sprite2D]

func update_power(power : int):
    var level = power / POWER_STEP
    if level > len(fire_sprites):
        # add sprite
        pass
