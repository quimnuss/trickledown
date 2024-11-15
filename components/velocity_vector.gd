extends Line2D

var line_scale := 0.1

func _ready() -> void:
    self.add_point(Vector2.ZERO)
    self.add_point(Vector2.ZERO)


func _process(_delta: float) -> void:
    self.global_rotation = 0
    self.points[1] = get_parent().linear_velocity * line_scale
