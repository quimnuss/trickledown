extends Node

var do_reset : bool = true

enum Scene {SYSTEM, CITY, WORK}

var focused_body : Node2D:
    set(body):
        focused_body = body
        focused_body_changed.emit()

signal focused_body_changed

enum Milestone {
    LAUNCH,
    CRASH_HOME,
    LAUNCH_ATMOSPHERE,
    ORBIT_ONE,
    CRASH_STAR,
    ORBIT_STABLE,
    CRASH_SATELLITE,
    ORBIT_STAR,
    ORBIT_SATELLITE,
    ESCAPE_VELOCITY,
    CRASH_ASTRONAUT,
    CRASH_MARS,
    ORBIT_ONE_MARS,
    ORBIT_STABLE_MARS
}

var disabled_milestones : Array[String] = ["VISIT_3"]
