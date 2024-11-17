extends RichTextLabel

func _ready() -> void:
    self.modulate.a = 0


func fade_in():
    var tween = create_tween()
    tween.tween_property(self, 'modulate:a', 1, 1)

func fade_out():
    var tween = create_tween()
    tween.tween_property(self, 'modulate:a', 0, 1)

func toast():
    var tween = create_tween()
    tween.tween_property(self, 'modulate:a', 1, 1)
    tween.tween_property(self, 'modulate:a', 0, 1).set_delay(2)

func _on_milestone_completed(milestone_enum : Singleton.Milestone):
    self.text = self.text.format({'milestone_text' : tr(Singleton.Milestone.keys()[milestone_enum])})
    toast()
