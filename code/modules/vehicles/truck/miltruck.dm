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

/obj/effect/vehicle_spawner/miltruck/random_vehicle()
	return pick(/obj/vehicle/multitile/miltruck,\
				/obj/vehicle/multitile/miltruck/miltruck_2,\
				/obj/vehicle/multitile/miltruck/miltruck_3)

/obj/effect/vehicle_spawner/miltruck/random_hardpoint()
	return pick(/obj/item/hardpoint/locomotion/truck/wheels,\
				/obj/item/hardpoint/locomotion/truck/treads)

/obj/effect/vehicle_spawner/miltruck/Initialize()
	. = ..()
	dir = pick(NORTH,SOUTH,EAST,WEST)
	spawn_vehicle()
	qdel(src)

	//PRESET: wheels installed, destroyed
/obj/effect/vehicle_spawner/miltruck/decrepit/spawn_vehicle()
	var/I = random_vehicle()
	var/obj/vehicle/multitile/MILTRUCK = new I(loc)

	load_misc(MILTRUCK)
	load_hardpoints(MILTRUCK)
	handle_direction(MILTRUCK)
	load_damage(MILTRUCK)
	MILTRUCK.update_icon()

/obj/effect/vehicle_spawner/miltruck/decrepit/load_hardpoints(obj/vehicle/multitile/miltruck/V)
	var/H = random_hardpoint()
	V.add_hardpoint(new H)

	//PRESET: wheels installed
/obj/effect/vehicle_spawner/miltruck/fixed/spawn_vehicle()
	var/I = random_vehicle()
	var/obj/vehicle/multitile/MILTRUCK = new I(loc)

	load_misc(MILTRUCK)
	load_hardpoints(MILTRUCK)
	handle_direction(MILTRUCK)
	MILTRUCK.update_icon()

/obj/effect/vehicle_spawner/miltruck/fixed/load_hardpoints(obj/vehicle/multitile/miltruck/V)
	var/H = random_hardpoint()
	V.add_hardpoint(new H)

	//PRESET: random
/obj/effect/vehicle_spawner/miltruck/random/spawn_vehicle()
	var/I = random_vehicle()
	var/obj/vehicle/multitile/MILTRUCK = new I(loc)

	if (prob(50))
		load_hardpoints(MILTRUCK)
	if (prob(50))
		load_damage(MILTRUCK)
	load_misc(MILTRUCK)
	handle_direction(MILTRUCK)
	MILTRUCK.update_icon()

/obj/effect/vehicle_spawner/miltruck/random/load_hardpoints(obj/vehicle/multitile/miltruck/V)
	var/H = random_hardpoint()
	V.add_hardpoint(new H)

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

	var/overdrive_next = 0
	var/overdrive_cooldown = 15 SECONDS
	var/overdrive_duration = 3 SECONDS
	var/overdrive_speed_mult = 0.3 // Additive (30% more speed, adds to 80% more speed)

	var/momentum_loss_on_weeds_factor = 0.2

	move_on_turn = TRUE

	var/list/mobs_under = list()
	var/image/under_image
	var/image/normal_image

	var/next_push = 0
	var/push_delay = 0.5 SECONDS

/obj/vehicle/multitile/atruck/Initialize()
	. = ..()
	under_image = image(icon, src, icon_state, layer = BELOW_MOB_LAYER)
	under_image.alpha = 127

	normal_image = image(icon, src, icon_state, layer = layer)

	icon_state = null

	RegisterSignal(SSdcs, COMSIG_GLOB_MOB_LOGIN, PROC_REF(add_default_image))

	for(var/I in GLOB.player_list)
		add_default_image(SSdcs, I)

/obj/vehicle/multitile/atruck/BlockedPassDirs(atom/movable/mover, target_dir)
	if(mover in mobs_under) //can't collide with the thing you're buckled to
		return NO_BLOCKED_MOVEMENT

	if(ismob(mover))
		var/mob/M = mover
		if(M.mob_flags & SQUEEZE_UNDER_VEHICLES)
			add_under_atruck(M)
			return NO_BLOCKED_MOVEMENT

		if(M.lying)
			return NO_BLOCKED_MOVEMENT

		if(M.mob_size >= MOB_SIZE_IMMOBILE && next_push < world.time)
			if(try_move(target_dir, force=TRUE))
				next_push = world.time + push_delay
				return NO_BLOCKED_MOVEMENT

	return ..()

/*
** PRESETS
*/
/obj/vehicle/multitile/atruck/pre_movement()
	. = ..()

	for(var/I in mobs_under)
		var/mob/M = I
		if(!(M.loc in locs))
			remove_under_atruck(M)

/obj/vehicle/multitile/atruck/proc/add_under_atruck(mob/living/L)
	if(L in mobs_under)
		return

	mobs_under += L
	RegisterSignal(L, COMSIG_PARENT_QDELETING, PROC_REF(remove_under_atruck))
	RegisterSignal(L, COMSIG_MOB_LOGIN, PROC_REF(add_client))
	RegisterSignal(L, COMSIG_MOVABLE_MOVED, PROC_REF(check_under_atruck))

	if(L.client)
		add_client(L)

/obj/vehicle/multitile/atruck/proc/remove_under_atruck(mob/living/L)
	SIGNAL_HANDLER
	mobs_under -= L

	if(L.client)
		L.client.images -= under_image
		add_default_image(SSdcs, L)

	UnregisterSignal(L, list(
		COMSIG_PARENT_QDELETING,
		COMSIG_MOB_LOGIN,
		COMSIG_MOVABLE_MOVED,
	))

/obj/vehicle/multitile/atruck/proc/check_under_atruck(mob/M, turf/oldloc, direction)
	SIGNAL_HANDLER
	if(!(M.loc in locs))
		remove_under_atruck(M)

/obj/vehicle/multitile/atruck/proc/add_client(mob/living/L)
	SIGNAL_HANDLER
	L.client.images += under_image
	L.client.images -= normal_image

/obj/vehicle/multitile/atruck/proc/add_default_image(subsystem, mob/M)
	SIGNAL_HANDLER
	M.client.images += normal_image

/obj/vehicle/multitile/atruck/Destroy()
	for(var/I in mobs_under)
		remove_under_atruck(I)

	for(var/I in GLOB.player_list)
		var/mob/M = I
		M.client.images -= normal_image

	return ..()


/obj/vehicle/multitile/atruck/pre_movement()
	if(locate(/obj/effect/alien/weeds) in loc)
		move_momentum *= momentum_loss_on_weeds_factor

	. = ..()


/obj/vehicle/multitile/atruck/attackby(obj/item/O, mob/user)
	if(user.z != z)
		return ..()

	if(iswelder(O) && health >= initial(health))
		if(!HAS_TRAIT(O, TRAIT_TOOL_BLOWTORCH))
			to_chat(user, SPAN_WARNING("You need a stronger blowtorch!"))
			return
		var/obj/item/hardpoint/H
		for(var/obj/item/hardpoint/potential_hardpoint in hardpoints)
			if(potential_hardpoint.health < initial(potential_hardpoint.health))
				H = potential_hardpoint
				break

		if(H)
			H.handle_repair(O, user)
			update_icon()
			return

	. = ..()


/obj/vehicle/multitile/atruck/handle_click(mob/living/user, atom/A, list/mods)
	if(mods["shift"] && !mods["alt"])
		if(overdrive_next > world.time)
			to_chat(user, SPAN_WARNING("You can't activate overdrive yet! Wait [round((overdrive_next - world.time) / 10, 0.1)] seconds."))
			return

		misc_multipliers["move"] -= overdrive_speed_mult
		addtimer(CALLBACK(src, PROC_REF(reset_overdrive)), overdrive_duration)

		overdrive_next = world.time + overdrive_cooldown
		to_chat(user, SPAN_NOTICE("You activate overdrive."))
		playsound(src, 'sound/vehicles/overdrive_activate.ogg', 75, FALSE)
		return

	return ..()

/obj/vehicle/multitile/atruck/proc/reset_overdrive()
	misc_multipliers["move"] += overdrive_speed_mult

/obj/vehicle/multitile/atruck/get_projectile_hit_boolean(obj/projectile/P)
	if(src == P.original) //clicking on the atruck itself will hit it.
		var/hitchance = P.get_effective_accuracy()
		if(prob(hitchance))
			return TRUE
	return FALSE

/obj/vehicle/multitile/atruck/Collide(atom/A)
	if(!seats[VEHICLE_DRIVER])
		return FALSE

	if(istype(A, /obj/structure/barricade/plasteel))
		return ..()

	if(istype(A, /turf/closed/wall) || \
	   istype(A, /obj/structure/barricade/sandbags) || \
	   istype(A, /obj/structure/barricade/metal) || \
	   istype(A, /obj/structure/barricade/deployable) || \
	   istype(A, /obj/structure/machinery/cryopod)) //Can no longer runover cryopods

		return FALSE

	return ..()

//Varients

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
