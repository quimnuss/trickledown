
# Now

- [ ] Set the solar system
- [ ] Add retrograde thrust

## Deute tècnic
- [ ] find a way to have the slow timescale as Engine.time_scale = 1
- [ ] Find a way to timescale only the physics and not the animations and cannon control
- [ ] Remove the SaveManager and use the resource directly
- [ ] Use singleton focused body and nothing else to reparent the camera (occhio with the astronaut death)

# Next

- [ ] Set the scale of the world to the astronaut instead of the planets (man as a mesure of all things)
- [ ] Get the Orbital component working and a planet orbiting (no edge cases)
- [ ] Get the Orbital component working for a ship orbiting
- [ ] Polish the physics engine area2d gravity-based approach
- [ ] Improve the launch mechanic to have a TRICKLEDOWN button at set thrust
- [ ] Add SAS for prograde

# Later

- [ ] Consider orbit edge cases
- [ ] Educate oneself with the orbital mechanics equations and how to simulate them
- [ ] SOI change trajectory drawing
- [ ] Switch to high definition planets instead of pixel art
- [ ] Game achievements and/or contracts
- [ ] Add rich man life highlights
- [ ] Add rich man side-effects
- [ ] Add successful landing feedback

# Way later

- [ ] Add the in-flight craft close up view
- [ ] Ship constructor

If ground flight is implemented:

- [ ] Proper parallax on ship view
- [ ] Translate from ground flight view to system view trajectory

# Done

- [x] Add time scale control
- [x] Slowdown time significantly
- [x] Camera controls
- [x] Add the in-flight burn mechanic
- [x] portraits center camera to astronaut
- [x] Switch to a scene manager
- [x] Add the resources logic
- [x] Add the Working mechanic
- [x] Add the city view
- [x] Add cannon thrust mechanic
- [x] Add crashes effects
- [x] Add crashes (no effects)
- [x] Add the launch craft mechanic
- [x] Add the ground craft close up view
- [x] Check if there's a way to allow for overlapping area2ds and just apply one
- [x] Start using the physics engine and simple ballistics instead of proper orbit mechanics to demonstrate
- [x] CharacterBody2D cosmonaut
- [x] RigidBody2D astronaut
