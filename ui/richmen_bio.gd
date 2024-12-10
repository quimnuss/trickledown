extends Control

@onready var bio_text : RichTextLabel = $VBoxContainer/BioText


func set_bio_text(richmen_name : String, richmen_bio : String):
    bio_text.text = "[font_size=30][center]%s[/center][/font_size]\n%s" % [richmen_name, richmen_bio]

func _on_richmen_portrait_toggled(toggled_on: bool) -> void:
    self.visible = toggled_on


func _on_close_button_pressed():
    self.visible = false
