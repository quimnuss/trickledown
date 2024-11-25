@tool
extends EditorScript

var json_path : String = 'res://data/richmen/celebrities.json'

func read_json(path : String):
    var json_text = FileAccess.get_file_as_string(path)
    var json_dict : Array[Dictionary]
    json_dict.assign(JSON.parse_string(json_text))
    return json_dict

func _run():
    var celebrities : Array[Dictionary] = read_json(json_path)
    for celebrity in celebrities:
        var richman_data : RichmanData = RichmanData.new()
        richman_data.name = celebrity['name']
        richman_data.bio = celebrity['bio']
        richman_data.worth = celebrity['worth']
        richman_data.uid = celebrity['name']
        var texture : Texture = load('res://data/richmen/img/%s.png' % celebrity['name'])
        richman_data.img = texture
        var save_result = ResourceSaver.save(richman_data, 'res://data/richmen/richmen_resources/%s.tres' % richman_data.name)
        if save_result != OK:
            print(save_result)
    print('%d celebrities processed.' % len(celebrities))
        
