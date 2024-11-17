extends RichTextLabel

var completed_milestones : Array[Singleton.Milestone]

var parametrized_text : String

func _ready() -> void:
    self.modulate.a = 0

    var current_save : SaveResource = load(Config.save_path)
    completed_milestones = current_save.milestones.duplicate()

    parametrized_text = self.text

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
    if milestone_enum not in completed_milestones:
        var milestone_name : String = Singleton.Milestone.keys()[milestone_enum]
        self.text = '[rainbow freq=0.5 sat=0.5][center][wave]%s[/wave][/center][/rainbow]' % tr(milestone_name)
        toast()
        completed_milestones.append(milestone_enum)
