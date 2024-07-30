/obj/vehicle/multitile/bmp
	name = "UPP Bmp-7"
	desc = "A giant piece of armor with a big gun, you know what to do. Entrance in the back."

	icon = 'icons/obj/vehicles/bmp.dmi'
	icon_state = "bmp"
	pixel_x = -48
	pixel_y = -48

	bound_width = 96
	bound_height = 96

	bound_x = -32
	bound_y = -32

	interior_map = /datum/map_template/interior/bmp


	passengers_slots = 12

	revivable_dead_slots = 2
	xenos_slots = 4

	wall_ram_damage = 1500

	entrances = list(
		"back" = list(0, 2)
	)

	movement_sound = 'sound/vehicles/tank_driving.ogg'
	honk_sound = 'sound/vehicles/honk_3_ambulence.ogg'

	required_skill = SKILL_VEHICLE_LARGE

	vehicle_flags = VEHICLE_CLASS_MEDIUM

	move_max_momentum = 3
	move_momentum_build_factor = 1.8
	move_turn_momentum_loss_factor = 0.6

	vehicle_light_range = 7

	// Rest (all the guns) is handled by the bmp turret hardpoint
	hardpoints_allowed = list(
		/obj/item/hardpoint/holder/bmp_turret,
		/obj/item/hardpoint/support/weapons_sensor,
		/obj/item/hardpoint/support/overdrive_enhancer,
		/obj/item/hardpoint/locomotion/bmp_wheels,
	)

	seats = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	active_hp = list(
		VEHICLE_DRIVER = null,
		VEHICLE_GUNNER = null,
	)

	dmg_multipliers = list(
		"all" = 1,
		"acid" = 1.5, // Acid melts the bmp
		"slash" = 0.7, // Slashing a massive, solid chunk of metal does very little except leave scratches
		"bullet" = 0.4,
		"explosive" = 0.8,
		"blunt" = 0.8,
		"abstract" = 1
	)

	explosive_resistance = 400

/obj/vehicle/multitile/bmp/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M34A2 \"[nickname]\" bmp" //this fluff allows it to be at the start of cams list
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list
	else
		camera.c_tag = "#[rand(1,100)] M34A2 bmp"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list

/obj/vehicle/multitile/bmp/load_role_reserved_slots()
	var/datum/role_reserved_slots/RRS = new
	RRS.category_name = "Crewmen"
	RRS.roles = list(JOB_CREWMAN, JOB_WO_CREWMAN, JOB_UPP_CREWMAN, JOB_PMC_CREWMAN)
	RRS.total = 2
	role_reserved_slots += RRS

/obj/vehicle/multitile/bmp/load_hardpoints()
	add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)

/obj/vehicle/multitile/bmp/add_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	add_verb(M.client, list(
		/obj/vehicle/multitile/proc/switch_hardpoint,
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
	))
	if(seat == VEHICLE_DRIVER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		add_verb(M.client, list(
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/toggle_gyrostabilizer,
			/obj/vehicle/multitile/proc/toggle_shift_click,
		))


/obj/vehicle/multitile/bmp/remove_seated_verbs(mob/living/M, seat)
	if(!M.client)
		return
	remove_verb(M.client, list(
		/obj/vehicle/multitile/proc/get_status_info,
		/obj/vehicle/multitile/proc/open_controls_guide,
		/obj/vehicle/multitile/proc/name_vehicle,
		/obj/vehicle/multitile/proc/switch_hardpoint,
	))
	SStgui.close_user_uis(M, src)
	if(seat == VEHICLE_DRIVER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/toggle_door_lock,
			/obj/vehicle/multitile/proc/activate_horn,
		))
	else if(seat == VEHICLE_GUNNER)
		remove_verb(M.client, list(
			/obj/vehicle/multitile/proc/cycle_hardpoint,
			/obj/vehicle/multitile/proc/toggle_gyrostabilizer,
			/obj/vehicle/multitile/proc/toggle_shift_click,
		))

//Called when players try to move vehicle
//Another wrapper for try_move()
/obj/vehicle/multitile/bmp/relaymove(mob/user, direction)
	if(user == seats[VEHICLE_DRIVER])
		return ..()

	if(user != seats[VEHICLE_GUNNER])
		return FALSE

	var/obj/item/hardpoint/holder/bmp_turret/T = null
	for(var/obj/item/hardpoint/holder/bmp_turret/TT in hardpoints)
		T = TT
		break
	if(!T)
		return FALSE

	if(direction == reverse_dir[T.dir] || direction == T.dir)
		return FALSE

	T.user_rotation(user, turning_angle(T.dir, direction))
	update_icon()

	return TRUE

/*
** PRESETS SPAWNERS
*/
/obj/effect/vehicle_spawner/bmp
	name = "bmp Spawner"
	icon = 'icons/obj/vehicles/bmp.dmi'
	icon_state = "bmp"
	pixel_x = -48
	pixel_y = -48


/obj/effect/vehicle_spawner/bmp/proc/load_fpw(obj/vehicle/multitile/bmp/V)
	var/obj/item/hardpoint/special/firing_port_weapon/FPW = new
	FPW.allowed_seat = VEHICLE_SUPPORT_GUNNER_ONE
	V.add_hardpoint(FPW)
	FPW.dir = turn(V.dir, 90)
	FPW.name = "Left "+ initial(FPW.name)
	FPW.origins = list(2, 0)
	FPW.muzzle_flash_pos = list(
		"1" = list(-18, 54),
		"2" = list(18, -54),
		"4" = list(44, 3),
		"8" = list(-42, -34)
	)

	FPW = new
	FPW.allowed_seat = VEHICLE_SUPPORT_GUNNER_TWO
	V.add_hardpoint(FPW)
	FPW.dir = turn(V.dir, -90)
	FPW.name = "Right "+ initial(FPW.name)
	FPW.origins = list(-2, 0)
	FPW.muzzle_flash_pos = list(
		"1" = list(16, 54),
		"2" = list(-18, -54),
		"4" = list(44, -34),
		"8" = list(-42, 2)
	)


/obj/effect/vehicle_spawner/bmp/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

//PRESET: turret, no hardpoints (not the one without turret for convenience, you still expect to have turret when you spawn "no hardpoints bmp")
/obj/effect/vehicle_spawner/bmp/spawn_vehicle()
	var/obj/vehicle/multitile/bmp/bmp = new (loc)

	load_misc(bmp)
	load_hardpoints(bmp)
	load_fpw(bmp)
	handle_direction(bmp)
	bmp.update_icon()

/obj/effect/vehicle_spawner/bmp/load_hardpoints(obj/vehicle/multitile/bmp/V)
	V.add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)

//PRESET: turret, treads installed
/obj/effect/vehicle_spawner/bmp/plain/load_hardpoints(obj/vehicle/multitile/bmp/V)
	V.add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/bmp_wheels)

//PRESET: no hardpoints
/obj/effect/vehicle_spawner/bmp/hull/load_hardpoints(obj/vehicle/multitile/bmp/V)
	return

//PRESET: default hardpoints, destroyed
/obj/effect/vehicle_spawner/bmp/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/bmp/bmp = new (loc)

	load_misc(bmp)
	handle_direction(bmp)
	load_hardpoints(bmp)
	load_damage(bmp)
	bmp.update_icon()

/obj/effect/vehicle_spawner/bmp/decrepit/load_hardpoints(obj/vehicle/multitile/bmp/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/artillery_module)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/bmp_wheels)
	V.add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)
	for(var/obj/item/hardpoint/holder/bmp_turret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/m56cupola)
		break

//PRESET: default hardpoints
/obj/effect/vehicle_spawner/bmp/fixed/load_hardpoints(obj/vehicle/multitile/bmp/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/artillery_module)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/bmp_wheels)
	V.add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)
	for(var/obj/item/hardpoint/holder/bmp_turret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/autocannon)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/towlauncher)
		break

//PRESET: lbt kit
/obj/effect/vehicle_spawner/bmp/fixed/lbt/load_hardpoints(obj/vehicle/multitile/bmp/V)
	V.add_hardpoint(new /obj/item/hardpoint/support/artillery_module)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/bmp_wheels)
	V.add_hardpoint(new /obj/item/hardpoint/holder/bmp_turret)
	for(var/obj/item/hardpoint/holder/bmp_turret/TT in V.hardpoints)
		TT.add_hardpoint(new /obj/item/hardpoint/primary/cannon)
		TT.add_hardpoint(new /obj/item/hardpoint/secondary/towlauncher)
		break
