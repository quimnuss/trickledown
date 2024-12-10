extends Control

@onready var bio_title : Label = %BioTitle
@onready var bio_text : RichTextLabel = %BioText


func set_bio_text(richmen_name : String, richmen_bio : String):
    bio_title.text = richmen_name
    bio_text.text = richmen_bio

func _on_richmen_portrait_toggled(toggled_on: bool) -> void:
    self.visible = toggled_on


func _on_close_button_pressed():
    self.visible = false


func _on_richmen_portrait_pressed():
    self.visible = not self.visible
