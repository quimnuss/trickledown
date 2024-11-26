@tool
extends Resource
class_name RichmenResourcesList

@export var richmen_resources_list : Array = DirAccess.get_files_at("res://data/richmen/richmen_resources/")
