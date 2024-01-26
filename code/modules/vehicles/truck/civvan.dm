/obj/vehicle/multitile/civvan
	name = "civilian van"
	desc = "A rather cheap hunk of metal with some wheels, you know what to do. Entrance on the sides."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_WEAK

	icon = 'icons/obj/vehicles/civvan.dmi'
	icon_state = "civvan"

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

	luminosity = 5

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/civvan
	)


/obj/vehicle/multitile/civvan/civvan_2
	name = "civilian van"
	icon_state = "civvan"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/obj/vehicle/multitile/civvan/civvan_3
	name = "CMB van"
	icon_state = "cmbvan"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/obj/vehicle/multitile/civvan/blu
	name = "civilian van"
	icon_state = "civvan_blu"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/obj/vehicle/multitile/civvan/grn
	name = "civilian van"
	icon_state = "civvan_grn"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/obj/vehicle/multitile/civvan/ylw
	name = "civilian van"
	icon_state = "civvan_ylw"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/obj/vehicle/multitile/civvan/civvan_4
	name = "Civilian Ambulance"
	icon_state = "ambulance"
	passengers_slots = 5
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

/*
** PRESETS SPAWNERS
*/

/obj/effect/vehicle_spawner/civvan
	name = "civvan spawner"
	icon = 'icons/obj/vehicles/civvan.dmi'
	icon_state = "civvan"

/obj/effect/vehicle_spawner/civvan/Initialize()
	. = ..()
	dir = pick(NORTH,SOUTH,EAST,WEST)
	spawn_vehicle()
	qdel(src)

	//PRESET: wheels installed, destroyed
/obj/effect/vehicle_spawner/civvan/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/civvan/CIVVAN = new (loc)

	load_misc(CIVVAN)
	load_hardpoints(CIVVAN)
	handle_direction(CIVVAN)
	load_damage(CIVVAN)
	CIVVAN.update_icon()

/obj/effect/vehicle_spawner/civvan/decrepit/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)

	//PRESET: wheels installed
/obj/effect/vehicle_spawner/civvan/fixed/spawn_vehicle()
	var/obj/vehicle/multitile/civvan/CIVVAN = new (loc)

	load_misc(CIVVAN)
	load_hardpoints(CIVVAN)
	handle_direction(CIVVAN)
	CIVVAN.update_icon()

/obj/effect/vehicle_spawner/civvan/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)

	//PRESET: random
/obj/effect/vehicle_spawner/civvan/random/spawn_vehicle()
	var/obj/vehicle/multitile/civvan/CIVVAN = new (loc)

	if (prob(50))
		load_hardpoints(CIVVAN)
	if (prob(50))
		load_damage(CIVVAN)
	load_misc(CIVVAN)
	handle_direction(CIVVAN)
	CIVVAN.update_icon()

/obj/effect/vehicle_spawner/civvan/random/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)
