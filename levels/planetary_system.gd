extends Node2D

@onready var tasklist: Control = %Tasklist
@onready var milestone_toast: RichTextLabel = $UI/MilestoneToast

signal change_scene(scene : Singleton.Scene)


func _ready() -> void:
    for milestoner in get_tree().get_nodes_in_group('milestoners'):
        milestoner.milestone_completed.connect(_on_milestone_completed)
        milestoner.milestone_completed.connect(tasklist._on_milestone_completed)
        milestoner.milestone_completed.connect(milestone_toast._on_milestone_completed)

func _on_to_city_button_pressed() -> void:
    var scene_id : int = Singleton.Scene.CITY as int
    change_scene.emit(scene_id)


func _on_to_work_button_pressed() -> void:
    change_scene.emit(Singleton.Scene.WORK)


func _on_milestone_completed(milestone_enum : Singleton.Milestone):
    prints('milestone',Singleton.Milestone.keys()[milestone_enum],'completed')
