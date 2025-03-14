extends Label

var jokes_path : String = "res://data/jokes_en.txt"

var file : FileAccess

const FILECURSORMARGIN : int = 1000

var typing_speed : float = 1

func _ready():
    #typing_tween = create_tween()

    jokes_path = "res://data/jokes_%s.txt" % Config.lang
    Config.language_changed.connect(_on_language_changed)

    load_jokes()


func load_jokes():
    file = FileAccess.open(jokes_path, FileAccess.READ)
    randomize()
    random_jump()
    self.text = next_joke()


func _on_language_changed():
    jokes_path = "res://data/jokes_%s.txt" % Config.lang
    load_jokes()


func random_jump():
    var rand_byte_cursor := randi() % (file.get_length() - FILECURSORMARGIN)
    file.seek(rand_byte_cursor)
    file.get_line() # clear incomplete line


func next_joke():
    if file.get_position() >= file.get_length():
        print("Resetting joke cursor")
        file.seek(0)
    var joke : String = file.get_line()
    return joke

var typing_tween : Tween

func _on_classify_pressed() -> void:
    self.text = next_joke()
    if is_instance_valid(typing_tween):
        typing_tween.kill()
    typing_tween = get_tree().create_tween()
    typing_tween.tween_property(self, "visible_characters", self.get_total_character_count(), typing_speed).from(0)
