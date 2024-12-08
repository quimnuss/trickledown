extends Resource
class_name SaveResource

@export var stonks : int = 1000
@export var num_richmen : int = 10

@export var launchpad_richman : RichmanData = null

@export var richmen_orbit : Array[RichmanData] = []

@export var richmen_deaths : Array[RichmanData] = []

@export var richmen_grounded : Array[RichmanData] = []

@warning_ignore("unused_signal")
signal richman_death(richman_data : RichmanData)

@export var milestones : Array[Singleton.Milestone] = []

@export var milestones_stats : Dictionary = {}

const LATEST_SAVE_VERSION : int = 2

@export var save_version : int = 2

@export var richmen_paths : PackedStringArray = preload("res://data/richmen/richmen_resources_list.tres").richmen_resources_list.duplicate()

var work_stonks_delta : int = 1000
var richmen_threshold : int = 10000

func _init():
    if self.resource_path and not is_instance_valid(self.launchpad_richman):
        push_warning('launchpad_richman not set')
        prints('launchpad_richman not set')
        

func cascade_num_richmen():
    richmen_paths = preload("res://data/richmen/richmen_resources_list.tres").richmen_resources_list.duplicate()
    # TODO merge with dead richmen or allow repeating
    for richman_data : RichmanData in richmen_grounded:
        var idx : int = richmen_paths.find(richman_data.resource_path.get_file())
        if idx >= 0:
            prints('Removed path', richmen_paths[idx], "since it's already loaded on grounded")
            richmen_paths.remove_at(idx)

    prints('Available richmen', len(richmen_paths))
    if richmen_paths.is_empty():
        prints("uh oh, pure anarchy achieved. You can't play.")
        return

    if num_richmen > len(richmen_grounded):
        for i in range(num_richmen - len(richmen_grounded)):
            var richman : RichmanData = random_richman_data()
            if richman:
                richmen_grounded.append(richman)
            else:
                prints('Returned an invalid richman')
    
    var pre_richmen_grounded_names : Array[String] = []
    for richman in richmen_grounded:
        pre_richmen_grounded_names.append(richman.name)
        
    if not launchpad_richman:
        launchpad_richman = richmen_grounded.pop_front()

    var richmen_grounded_names : Array[String] = []
    for richman in richmen_grounded:
        richmen_grounded_names.append(richman.name)
    prints('launchpad richmen is ', launchpad_richman.name, " and grounded are ", richmen_grounded_names)

func rotate_richmen():
    if self.launchpad_richman:
        self.richmen_orbit.append(self.launchpad_richman)
    self.launchpad_richman = random_richman_data()
    
    
func random_richman_data() -> RichmanData:
    var richmen_res_path : String = richmen_paths[randi() % len(richmen_paths)]
    return ResourceLoader.load("res://data/richmen/richmen_resources/" + richmen_res_path)


func reset():
    prints('Resetting save')
    var default_resource = SaveResource.new()
    stonks = default_resource.stonks
    num_richmen = default_resource.num_richmen
    launchpad_richman = null
    richmen_orbit = []
    richmen_deaths = []
    richmen_grounded = []
    milestones = []
    milestones_stats = {}
    cascade_num_richmen()


func death(richman_data : RichmanData):
    prints(richman_data.name,'died')
    richmen_orbit.erase(richman_data)
    richmen_deaths.append(richman_data)
    save()
    self.emit_changed()

func increase_stonks():
    stonks += work_stonks_delta
    @warning_ignore("integer_division")
    num_richmen += stonks / richmen_threshold
    stonks = stonks % richmen_threshold
    
    save()
    emit_changed()


func save():
    var error := ResourceSaver.save(self, self.resource_path)
    if error:
        print("An error happened while saving data: ", error)
