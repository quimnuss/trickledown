extends Label

var jokes_path : String = "res://data/one_liner_jokes.txt"

var file : FileAccess


func _ready():
    file = FileAccess.open(jokes_path, FileAccess.READ)
    self.text = next_joke()


func next_joke():
    var joke : String = file.get_line()
    return joke


func _on_classify_pressed() -> void:
    self.text = next_joke()
