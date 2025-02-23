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

	health = 500

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/civvan
	)


/obj/vehicle/multitile/civvan/red
	name = "civilian van"
	icon_state = "civvan"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

/obj/vehicle/multitile/civvan/cmb
	name = "CMB van"
	icon_state = "cmbvan"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan
	honk_sound = 'sound/vehicles/vehicle_siren.mp3'

/obj/vehicle/multitile/civvan/blu
	name = "civilian van"
	icon_state = "civvan_blu"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan


/obj/vehicle/multitile/civvan/grn
	name = "civilian van"
	icon_state = "civvan_grn"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

/obj/vehicle/multitile/civvan/ylw
	name = "civilian van"
	icon_state = "civvan_ylw"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan

/obj/vehicle/multitile/civvan/med
	name = "Civilian Ambulance"
	icon_state = "ambulance"
	passengers_slots = 5
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan
	honk_sound = 'sound/vehicles/vehicle_siren.mp3'

/obj/vehicle/multitile/civvan/bank
	name = "Commerical Armored Transport"
	icon_state = "banktruck"
	passengers_slots = 4
	xenos_slots = 4
	interior_map = /datum/map_template/interior/civvan
	health = 1000

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


//red fixed
/obj/effect/vehicle_spawner/civvan/red
	name = "civilian van"
	icon_state = "civvan"

/obj/effect/vehicle_spawner/civvan/red/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/red/civvan_2 = new (loc)

	load_misc(civvan_2)
	load_hardpoints(civvan_2)
	handle_direction(civvan_2)
	civvan_2.update_icon()

/obj/effect/vehicle_spawner/civvan/red/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//blue fixed
/obj/effect/vehicle_spawner/civvan/blu
	name = "civilian van"
	icon_state = "civvan_blu"

/obj/effect/vehicle_spawner/civvan/blu/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/blu/civvan_3 = new (loc)

	load_misc(civvan_3)
	load_hardpoints(civvan_3)
	handle_direction(civvan_3)
	civvan_3.update_icon()

/obj/effect/vehicle_spawner/civvan/blu/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//green fixed
/obj/effect/vehicle_spawner/civvan/grn
	name = "civilian van"
	icon_state = "civvan_grn"

/obj/effect/vehicle_spawner/civvan/grn/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/grn/civvan_4 = new (loc)

	load_misc(civvan_4)
	load_hardpoints(civvan_4)
	handle_direction(civvan_4)
	civvan_4.update_icon()

/obj/effect/vehicle_spawner/civvan/grn/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//yellow fixed
/obj/effect/vehicle_spawner/civvan/ylw
	name = "civilian van"
	icon_state = "civvan_ylw"

/obj/effect/vehicle_spawner/civvan/ylw/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/ylw/civvan_5 = new (loc)

	load_misc(civvan_5)
	load_hardpoints(civvan_5)
	handle_direction(civvan_5)
	civvan_5.update_icon()

/obj/effect/vehicle_spawner/civvan/ylw/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//CMB fixed
/obj/effect/vehicle_spawner/civvan/cmb
	name = "CMB van"
	icon_state = "cmbvan"

/obj/effect/vehicle_spawner/civvan/cmb/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/cmb/civvan_6 = new (loc)

	load_misc(civvan_6)
	load_hardpoints(civvan_6)
	handle_direction(civvan_6)
	civvan_6.update_icon()

/obj/effect/vehicle_spawner/civvan/cmb/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//Med fixed
/obj/effect/vehicle_spawner/civvan/med
	name = "Ambulance"
	icon_state = "ambulance"

/obj/effect/vehicle_spawner/civvan/med/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/med/civvan_7 = new (loc)

	load_misc(civvan_7)
	load_hardpoints(civvan_7)
	handle_direction(civvan_7)
	civvan_7.update_icon()

/obj/effect/vehicle_spawner/civvan/med/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)


//Bank fixed
/obj/effect/vehicle_spawner/civvan/bank
	name = "Commerical Armored Transport"
	icon_state = "banktruck"

/obj/effect/vehicle_spawner/civvan/bank/fixed/spawn_vehicle()
	var obj/vehicle/multitile/civvan/bank/civvan_8 = new (loc)

	load_misc(civvan_8)
	load_hardpoints(civvan_8)
	handle_direction(civvan_8)
	civvan_8.update_icon()

/obj/effect/vehicle_spawner/civvan/bank/fixed/load_hardpoints(obj/vehicle/multitile/civvan/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/truck/wheels/civvan)
