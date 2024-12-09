extends VBoxContainer

func _ready() -> void:
    var milestones : Array = Singleton.Milestone.keys()
    for milestone in milestones:
        var milestone_name : String = milestone as String
        var milestone_ui : Control = preload("res://ui/milestone_checkbox.tscn").instantiate()
        milestone_ui.text = tr(milestone_name)
        #TODO use custom checkbox scene and set proper data
        milestone_ui.name = milestone_name
        milestone_ui.disabled = milestone_name in Singleton.disabled_milestones
        add_child(milestone_ui)    
