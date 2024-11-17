extends Resource
class_name SaveResource

@export var stonks : int = 1000
@export var num_richmen : int = 10

@export var richmen_launchpad : int = 0
@export var richmen_orbit : Array[int] = []

@export var richmen_deaths : Array[int] = []

var richmen_value : Dictionary = {
    'Xef Bexos' : 177,
    'Warren Vuffett': 96,
    'Bernard Ernault': 150,
    'Larry Ellison': 93,
    'Elon Tusk' : 151,
    'Bill Potes' : 124
}
@warning_ignore("unused_signal")
signal richman_death(id : int)

@export var milestones : Array[Singleton.Milestone] = []

@export var milestones_stats : Dictionary = {}


func rotate_richmen():
    self.richmen_orbit.append(self.richmen_launchpad)
    self.richmen_launchpad = (self.richmen_launchpad + 1) % len(richmen_value)

func reset():
    var default_resource = SaveResource.new()
    stonks = default_resource.stonks
    num_richmen = default_resource.num_richmen
    richmen_launchpad = default_resource.richmen_launchpad
    richmen_orbit = default_resource.richmen_orbit
    richmen_deaths = default_resource.richmen_deaths
    milestones = default_resource.milestones
    milestones_stats = default_resource.milestones_stats

func death(id : int):
    prints(id,'died')
    richmen_orbit.erase(id)
    richmen_deaths.append(id)
    save()
    self.emit_changed()

func save():
    var error := ResourceSaver.save(self, self.resource_path)
    if error:
        print("An error happened while saving data: ", error)
