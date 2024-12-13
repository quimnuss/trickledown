extends RichTextLabel

var current_save : SaveResource

func _ready():
    assert(ResourceLoader.exists(Config.save_path))
    current_save = load(Config.save_path)
    current_save.changed.connect(_on_current_save)
    current_save.emit_changed()
    
func _on_current_save():
    var richmen := current_save.num_richmen
    if richmen > 4:
        self.text = tr('sick town') % current_save.num_richmen
    else:
        self.text = tr('healthy town')
