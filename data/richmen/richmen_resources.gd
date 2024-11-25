@tool
extends Node
class_name RichmenResources

var richmen : Array[RichmanData] = []

@export var richmen_paths : PackedStringArray = []

func load_richmen():
    richmen.clear()
    for file_name in DirAccess.get_files_at("res://data/richmen/richmen_resources/"):
        if (file_name.get_extension() == "tres"):
            richmen.append(ResourceLoader.load("res://data/richmen/richmen_resources/" + file_name))

func _ready():
    richmen_paths = DirAccess.get_files_at("res://data/richmen/richmen_resources/")
    
func random_richman_data() -> RichmanData:
    var richmen_res_path : String = richmen_paths[randi() % len(richmen_paths)]
    return ResourceLoader.load("res://data/richmen/richmen_resources/" + richmen_res_path)
