extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# TODO state machine
var current_power = 0


func exhaust(power : int):
    if power > 0 and current_power == 0:
        animation_player.play('exhaust_1_start')
        current_power = power
    elif power == 0 and current_power > power:
        animation_player.play('exhaust_1_stop')
        current_power = power


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
    match anim_name:
        'exhaust_1_start':
            animation_player.play('exhaust_1_loop')
