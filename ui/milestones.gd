extends VBoxContainer

func _ready() -> void:
    var milestones : Array = Singleton.Milestone.keys()
    for milestone in milestones:
        var milestone_ui : Control = CheckBox.new()
        milestone_ui.button_mask = 0
        milestone_ui.text = tr(milestone)
        milestone_ui.autowrap_mode = TextServer.AUTOWRAP_WORD
        #TODO use custom checkbox scene and set proper data
        milestone_ui.name = milestone
        #milestone_ui.clip_text = true
        add_child(milestone_ui)
