extends Node

var do_reset : bool = true
enum Scene {SYSTEM, CITY, WORK}
var focused_body : Node2D:
    set(body):
        focused_body = body
        focused_body_changed.emit()

signal focused_body_changed
