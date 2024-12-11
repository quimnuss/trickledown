# Now - Ship requirements

- [ ] particle gather animation flow towards the milestone list (component)
- [ ] limit cannon angles

## Deute tècnic

- [ ] find a way to have the slow timescale as Engine.time_scale = 1
- [ ] Find a way to timescale only the physics and not the animations and cannon control
- [ ] Remove the SaveManager and use the resource directly
- [ ] Use singleton focused body and nothing else to reparent the camera (occhio with the astronaut death)

# Next

- [ ] Set more solar system
- [ ] display which SOI the astronaut is in (on_body_entered if gravity check priority and decide which SOI it is)
- [ ] make the milestones incremental (don't put the whole list)
- [ ] Set the scale of the world to the astronaut instead of the planets (man as a mesure of all things)
- [ ] Polish the physics engine area2d gravity-based approach
- [ ] news feed filter by richmen
- [ ] light

# Later

- [ ] "Hidden folks"-style city with stories 
- [ ] Stats on milestones:  I crashed # times on the home planet
- [ ] Get the Orbital component working for a ship orbiting
- [ ] Get the Orbital component working and a planet orbiting (no edge cases)
- [ ] Add SAS for prograde
- [ ] Consider orbit edge cases
- [ ] Educate oneself with the orbital mechanics equations and how to simulate them
- [ ] SOI change trajectory drawing
- [ ] Add rich man life highlights
- [ ] Add successful landing feedback

# Way later

- [ ] (posponed) Correctly save astronauts' position and velocity
- [ ] Add the in-flight craft close up view
- [ ] Ship constructor
- [ ] Check https://jokeapi.dev/

If ground flight is implemented:

- [ ] Proper parallax on ship view
- [ ] Translate from ground flight view to system view trajectory

# Done

- [x] review and translate all bios
- [x] exponential time warp instead of linear
- [x] Show bio on launchpad click
- [x] other planet goals
- [x] loop sistema song
- [x] camera shake
- [~] check animation on milestone completed toast
- [~] money rain on town after astronaut launch
- [x] Add more news
- [x] event feed animation -> color change depending on karma
- [x] change controls to full rcs? 8 way movement + q/e to rotate
- [x] code a shaking component and apply it to controls
- [x] animate 0 rics + fletxa to work
- [x] feed only toggable in sistema view, always visible in others
- [x] increase milestones menu speed
- [x] typed text effect on jokes
- [x] Reset evens when empty
- [x] time warp label
- [x] increase time increments
- [x] more camera zoom
- [x] Improve catalan jokes
- [x] Set the solar system
- [~] ~Switch to high definition planets instead of pixel art~
- [x] Fix the cannon clamping
- [x] Improve the launch mechanic to have a TRICKLEDOWN button at set thrust
- [x] Interactable city: simple animations
- [x] Lower thrust strength
- [x] Game achievements and/or contracts
- [x] Interactable city: story animations
- [x] Remove done goals (or move them down)
- [x] Add rich man side-effects in the city : fog, greyness, loss of animation
- [x] Interactable city: greybox
- [x] fix time warping
- [x] hard milestones: orbits
- [x] fix tutorial of orbital rich
- [x] Add the richmen feats --> news feeds are enough
- [x] Take karma into account on news feed (react to richmen deaths and births)
- [x] Add richmen rellevant news on spawn
- [x] Add retrograde thrust
- [x] Add the milestone feed: killzone kill, planet kill, star kill...
- [x] Add out of universe death
- [x] internationalization en,ca
- [x] Add welcome level
- [x] Add tutorial
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
