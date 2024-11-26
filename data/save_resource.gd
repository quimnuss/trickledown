extends Resource
class_name SaveResource

@export var stonks : int = 1000
@export var num_richmen : int = 10

@export var launchpad_richman : RichmanData = null

@export var richmen_orbit : Array[RichmanData] = []

@export var richmen_deaths : Array[RichmanData] = []

@warning_ignore("unused_signal")
signal richman_death(richman_data : RichmanData)

@export var milestones : Array[Singleton.Milestone] = []

@export var milestones_stats : Dictionary = {}

const LATEST_SAVE_VERSION : int = 1

var save_version : int = 2

var richmen_paths = DirAccess.get_files_at("res://data/richmen/richmen_resources/")

func rotate_richmen():
    if self.launchpad_richman:
        self.richmen_orbit.append(self.launchpad_richman)
    self.launchpad_richman = random_richman_data()
    
    
func random_richman_data() -> RichmanData:
    var richmen_res_path : String = richmen_paths[randi() % len(richmen_paths)]
    return ResourceLoader.load("res://data/richmen/richmen_resources/" + richmen_res_path)


func reset():
    var default_resource = SaveResource.new()
    stonks = default_resource.stonks
    num_richmen = default_resource.num_richmen
    richmen_launchpad = default_resource.richmen_launchpad
    launchpad_richman = null
    richmen_orbit = default_resource.richmen_orbit
    richmen_deaths = default_resource.richmen_deaths
    milestones = default_resource.milestones
    milestones_stats = default_resource.milestones_stats


func death(richman_data : RichmanData):
    prints(richman_data.name,'died')
    richmen_orbit.erase(richman_data)
    richmen_deaths.append(richman_data)
    save()
    self.emit_changed()


func save():
    var error := ResourceSaver.save(self, self.resource_path)
    if error:
        print("An error happened while saving data: ", error)
