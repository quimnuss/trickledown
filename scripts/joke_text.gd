extends Label

var jokes_path : String = "res://data/one_liner_jokes.txt"

var file : FileAccess

const FILECURSORMARGIN : int = 1000

func _ready():
    file = FileAccess.open(jokes_path, FileAccess.READ)
    randomize()
    random_jump()
    self.text = next_joke()

func random_jump():
    var rand_byte_cursor := randi() % (file.get_length() - FILECURSORMARGIN)
    print("jump to %d" % rand_byte_cursor)
    file.seek(rand_byte_cursor)
    var tmp := file.get_line() # clear incomplete line
    print(tmp, file.get_position())

func next_joke():
    if file.get_position() >= file.get_length():
        print("Resetting joke cursor")
        file.seek(0)
    var joke : String = file.get_line()
    return joke



func _on_classify_pressed() -> void:
    self.text = next_joke()
