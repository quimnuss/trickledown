extends Node


var current_save : SaveResource

var richmen : int = 0

var max_smog : int = 20

@onready var smog: Node2D = $"../Smog"

var buildings : Array[Node] = []

var capitalist_buildings : Array[Node]

var capitalism_level : int = 0

var richmen_step : int = 3

func _ready() -> void:
    current_save = load(Config.save_path)
    capitalism_level = current_save.num_richmen % richmen_step
    current_save.changed.connect(_on_save_changed)
    buildings = get_tree().get_nodes_in_group("buildings")
    randomize()
    buildings.shuffle()
    print(buildings)
    

func capitalism_consequences():
    var smoguiness = richmen/float(max_smog)
    smog.modulate = min(smoguiness,1.0)
    capitalism_level = richmen % richmen_step
    var capitalized_buildings : int = capitalism_level - len(capitalist_buildings)
    if capitalized_buildings > 0:
        for i in range(capitalized_buildings):
            var building : Node = buildings.pick_random()
            buildings.erase(building)
            capitalist_buildings.append(building)
            #building.get_node_or_null('liberation')
            building.modulate = Color.GRAY
    elif capitalized_buildings < 0 and not capitalist_buildings.is_empty():
        for i in range(abs(capitalized_buildings)):
            var building : Node = capitalist_buildings.pick_random()
            capitalist_buildings.erase(building)
            buildings.append(building)
            building.modulate = Color.WHITE
    

func _on_save_changed():
    capitalism_consequences()
