extends Resource
class_name EventsReader

enum Karma {GOOD, NEUTRAL, BAD}

static func read_from_JSON(path : String) -> Array[Dictionary]:
    var json_text = FileAccess.get_file_as_string(path)
    var json_dict : Array[Dictionary]
    json_dict.assign(JSON.parse_string(json_text))
    return json_dict
    
