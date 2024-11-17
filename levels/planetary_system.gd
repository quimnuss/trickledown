extends Node2D

@onready var tasklist: Control = %Tasklist
@onready var milestone_toast: RichTextLabel = $UI/MilestoneToast

signal change_scene(scene : Singleton.Scene)

var current_save : SaveResource

func _ready() -> void:
    current_save = load(Config.save_path)
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
    if milestone_enum not in current_save.milestones:
        prints('milestone',Singleton.Milestone.keys()[milestone_enum],'completed')
        current_save.milestones.append(milestone_enum)
    current_save.milestones_stats[milestone_enum] = current_save.milestones_stats.get(milestone_enum, 0) + 1
    current_save.save()
