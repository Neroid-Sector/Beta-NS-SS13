/obj/vehicle/multitile/miltruck
	name = "military towing truck"
	desc = "A rather new hunk of metal with some locomotion, you know what to do. Entrance on the sides."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_WEAK

	icon = 'icons/obj/vehicles/miltruck.dmi'
	icon_state = "miltruck_1"
	pixel_x = -16
	pixel_y = -16

	bound_width = 64
	bound_height = 64

	bound_x = 0
	bound_y = 0


	interior_map = /datum/map_template/interior/truck
	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

	movement_sound = 'sound/vehicles/tank_driving.ogg'
	honk_sound = 'sound/vehicles/honk_2_truck.ogg'

	luminosity = 8

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels,
		/obj/item/hardpoint/locomotion/truck/treads
	)

/obj/vehicle/multitile/miltruck/miltruck_2
	name = "military flatbed truck"
	desc = "A rather new hunk of metal with some locomotion, you know what to do. Entrance on the sides."
	icon_state = "miltruck_2"

/obj/vehicle/multitile/miltruck/miltruck_3
	name = "military covered truck"
	desc = "A rather new hunk of metal with some locomotion, you know what to do. Entrance on the back and sides."
	icon_state = "miltruck_3"
	passengers_slots = 8
	xenos_slots = 8
	interior_map = /datum/map_template/interior/van

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0),
		"back_left" = list(1, 2),
		"back_right" = list(0, 2)
	)

/*
** PRESETS SPAWNERS
*/

/obj/effect/vehicle_spawner/miltruck
	name = "miltruck spawner"
	icon = 'icons/obj/vehicles/miltruck.dmi'
	icon_state = "miltruck_1"
	pixel_x = -16
	pixel_y = -16

/obj/effect/vehicle_spawner/miltruck/Initialize()
	. = ..()
	dir = pick(NORTH,SOUTH,EAST,WEST)
	spawn_vehicle()
	qdel(src)

//miltruck 2 fixed
/obj/effect/vehicle_spawner/miltruck/miltruck_2
	name = "Military flatbed"
	icon_state = "miltruck_2"

/obj/effect/vehicle_spawner/miltruck/miltruck_2/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/miltruck/miltruck_2/miltruck_2 = new (loc)

	load_misc(miltruck_2)
	load_hardpoints(miltruck_2)
	handle_direction(miltruck_2)
	miltruck_2.update_icon()

/obj/effect/vehicle_spawner/miltruck/miltruck_2/fixed/load_hardpoints(obj/vehicle/multitile/miltruck/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels)


//miltruck 3 fixed
/obj/effect/vehicle_spawner/miltruck/miltruck_3
	name = "Covered Military truck"
	icon_state = "miltruck_3"

/obj/effect/vehicle_spawner/miltruck/miltruck_3/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/miltruck/miltruck_3/miltruck_3 = new (loc)

	load_misc(miltruck_3)
	load_hardpoints(miltruck_3)
	handle_direction(miltruck_3)
	miltruck_3.update_icon()

/obj/effect/vehicle_spawner/miltruck/miltruck_3/fixed/load_hardpoints(obj/vehicle/multitile/miltruck/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/treads)



//---------


//Armored Truck

/obj/vehicle/multitile/atruck
	name = "Armored Truck"
	desc = "A rather tough looking old hunk of metal with four wheels, you know what to do. Entrance on the back and sides."
	layer = ABOVE_XENO_LAYER

	icon = 'icons/obj/vehicles/atruck.dmi'
	icon_state = "atruck"
	pixel_x = -16
	pixel_y = -16

	bound_width = 64
	bound_height = 64

	bound_x = 0
	bound_y = 0

	interior_map = /datum/map_template/interior/atruck

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0),
		"back_left" = list(1, 2),
		"back_right" = list(0, 2)
	)

	vehicle_flags = VEHICLE_CLASS_LIGHT

	passengers_slots = 8
	xenos_slots = 2

	misc_multipliers = list(
		"move" = 0.5, // fucking annoying how this is the only way to modify speed
		"accuracy" = 1,
		"cooldown" = 1
	)

	movement_sound = 'sound/vehicles/tank_driving.ogg'
	honk_sound = 'sound/vehicles/honk_1_truck.ogg'

	vehicle_light_range = 8

	move_max_momentum = 3

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/atruck,
	)

	move_turn_momentum_loss_factor = 1

	req_access = list()
	req_one_access = list()

	door_locked = FALSE

	mob_size_required_to_hit = MOB_SIZE_XENO



//Variants

//-Trauma Team

/obj/vehicle/multitile/atruck/trauma
	name = "Armored Trauma Team Ambulance"
	desc = "A rather tough looking old hunk of metal with four wheels, you know what to do. Entrance on the back and sides."

	icon = 'icons/obj/vehicles/atruck.dmi'
	icon_state = "trauma_truck"
	interior_map = /datum/map_template/interior/atruck_med
	honk_sound = 'sound/vehicles/vehicle_siren.mp3'

/obj/vehicle/multitile/atruck/cmb
	name = "Armored CMB S.W.A.T. Transport"
	icon = 'icons/obj/vehicles/atruck.dmi'
	icon_state = "cmb_truck"
	interior_map = /datum/map_template/interior/atruck_cmb
	honk_sound = 'sound/vehicles/vehicle_siren.mp3'

/*
** PRESETS SPAWNERS
*/

/obj/effect/vehicle_spawner/atruck
	name = "atruck Spawner"
	icon = 'icons/obj/vehicles/atruck.dmi'
	icon_state = "atruck"
	pixel_x = -16
	pixel_y = -16

/obj/effect/vehicle_spawner/atruck/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/atruck/spawn_vehicle()
	var/obj/vehicle/multitile/atruck/atruck = new (loc)

	load_misc(atruck)
	handle_direction(atruck)
	atruck.update_icon()

//PRESET: wheels installed, destroyed
/obj/effect/vehicle_spawner/atruck/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/atruck/atruck = new (loc)

	load_misc(atruck)
	load_hardpoints(atruck)
	handle_direction(atruck)
	load_damage(atruck)
	atruck.update_icon()

/obj/effect/vehicle_spawner/atruck/decrepit/load_hardpoints(obj/vehicle/multitile/atruck/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/atruck)

//PRESET: wheels installed
/obj/effect/vehicle_spawner/atruck/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/atruck/atruck = new (loc)

	load_misc(atruck)
	load_hardpoints(atruck)
	handle_direction(atruck)
	atruck.update_icon()

/obj/effect/vehicle_spawner/atruck/fixed/load_hardpoints(obj/vehicle/multitile/atruck/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/atruck)


//trauma
/obj/effect/vehicle_spawner/atruck/trauma
	name = "trauma team"
	icon_state = "trauma_truck"

/obj/effect/vehicle_spawner/atruck/trauma/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/atruck/trauma/atruck_trauma = new (loc)

	load_misc(atruck_trauma)
	load_hardpoints(atruck_trauma)
	handle_direction(atruck_trauma)
	atruck_trauma.update_icon()

/obj/effect/vehicle_spawner/atruck/trauma/fixed/load_hardpoints(obj/vehicle/multitile/atruck/trauma/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/atruck)

//cmb
/obj/effect/vehicle_spawner/atruck/cmb
	name = "SWAT truck"
	icon_state = "cmb_truck"

/obj/effect/vehicle_spawner/atruck/cmb/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/atruck/cmb/atruck_cmb = new (loc)

	load_misc(atruck_cmb)
	load_hardpoints(atruck_cmb)
	handle_direction(atruck_cmb)
	atruck_cmb.update_icon()

/obj/effect/vehicle_spawner/atruck/cmb/fixed/load_hardpoints(obj/vehicle/multitile/atruck/trauma/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/atruck)
