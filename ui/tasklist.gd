extends Control
@onready var show_tasklist_button: Button = $TasklistContainer/ShowTasklistButton
@onready var tasklist_container: HBoxContainer = $TasklistContainer

@export var tasklist_container_width : int = 404
@onready var milestones: VBoxContainer = %Milestones

const EXPAND_LIST_TIME : float = 0.5

func _ready():
    if not Config.skip_tutorial or Config.skip_tutorial:
        tasklist_container.position.x = 0
        await get_tree().create_timer(2).timeout
        # longer collapse()
        show_tasklist_button.button_pressed = false
        var tween = get_tree().create_tween()
        tween.tween_property(tasklist_container, "position:x", -tasklist_container_width, 2)
        tween.play()


func collapse():
    show_tasklist_button.button_pressed = false
    var tween = get_tree().create_tween()
    tween.tween_property(tasklist_container, "position:x", -tasklist_container_width, EXPAND_LIST_TIME)
    tween.play()


func expand():
    show_tasklist_button.button_pressed = true
    var tween = get_tree().create_tween()
    tween.tween_property(tasklist_container, "position:x", 0, EXPAND_LIST_TIME)
    tween.play()

func highlight_tasklist_button():
    var original_modulate = Color.WHITE
    var high_color : Color = Color.GREEN
    var tween : Tween = get_tree().create_tween()
    const NUM_OSCILLATIONS : int = 2
    for i in range(NUM_OSCILLATIONS):
        tween.tween_property(show_tasklist_button, "modulate", high_color, 0.25)
        tween.tween_property(show_tasklist_button, "modulate", Color.WHITE, 0.25)
    tween.tween_property(show_tasklist_button, "modulate", original_modulate, 0.25)


func _on_show_tasklist_button_pressed() -> void:
    if show_tasklist_button.button_pressed:
        expand()
    else:
        collapse()

func _on_milestone_completed(milestone_enum : Singleton.Milestone):
    for child in milestones.get_children():
        var checkbox_child : CheckBox = child as CheckBox
        if checkbox_child.name == Singleton.Milestone.keys()[milestone_enum]:
            if not checkbox_child.button_pressed:
                checkbox_child.button_pressed = true
                #if show_tasklist_button.pressed:
                highlight_tasklist_button()
                await get_tree().create_timer(5).timeout
                checkbox_child.disabled = true
                milestones.move_child(checkbox_child, -1)
            break
