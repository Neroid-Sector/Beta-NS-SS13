/obj/vehicle/multitile/tank/aev
	name = "M34A1 Armored Engineering Vehicle"
	desc = "A giant piece of armor with a plow, you know what to do. Entrance in the back."
	desc_lore = "M34A1 is an rather uncommon modification of the Standard M34A2 Longstreet tank, developed for use by USCM Engineers to clear minefields, debris, and other obstacles. It features no standard weapon mounting points, and instead is intended for purely technical support."

	icon_state = "aev_base"

	hardpoints_allowed = list(
		/obj/item/hardpoint/support/overdrive_enhancer,
		/obj/item/hardpoint/armor/ballistic,
		/obj/item/hardpoint/armor/caustic,
		/obj/item/hardpoint/armor/concussive,
		/obj/item/hardpoint/armor/paladin,
		/obj/item/hardpoint/armor/snowplow,
		/obj/item/hardpoint/locomotion/treads,
		/obj/item/hardpoint/locomotion/treads/robust,
	)


	required_skill = SKILL_VEHICLE_LARGE
	interior_map = /datum/map_template/interior/aev

	active_hp = list(VEHICLE_DRIVER = null)

	explosive_resistance = 750

	passengers_slots = 6
	//this is done in case VCs die inside the tank, so that someone else can come in and take them out.
	revivable_dead_slots = 2
	xenos_slots = 4

	wall_ram_damage = 2000

/obj/vehicle/multitile/tank/aev/initialize_cameras(change_tag = FALSE)
	if(!camera)
		camera = new /obj/structure/machinery/camera/vehicle(src)
	if(change_tag)
		camera.c_tag = "#[rand(1,100)] M34E1 \"[nickname]\" AEV"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list
	else
		camera.c_tag = "#[rand(1,100)] M34E1 AEV"
		if(camera_int)
			camera_int.c_tag = camera.c_tag + " interior" //this fluff allows it to be at the start of cams list

/obj/vehicle/multitile/tank/aev/load_hardpoints()
	return

/obj/effect/vehicle_spawner/aev
	name = "AEV Spawner"
	icon = 'icons/obj/vehicles/tank.dmi'
	icon_state = "aev_base"
	pixel_x = -48
	pixel_y = -48

/obj/effect/vehicle_spawner/aev/Initialize()
	. = ..()
	spawn_vehicle()
	qdel(src)

/obj/effect/vehicle_spawner/aev/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/AEV = new(loc)

	load_misc(AEV)
	load_hardpoints(AEV)
	handle_direction(AEV)
	AEV.update_icon()

	return AEV

/obj/effect/vehicle_spawner/aev/load_hardpoints(obj/vehicle/multitile/tank/V)
	V.add_hardpoint(new /obj/item/hardpoint/locomotion/treads)
	V.add_hardpoint(new /obj/item/hardpoint/armor/snowplow)
	V.add_hardpoint(new /obj/item/hardpoint/support/overdrive_enhancer)

/obj/effect/vehicle_spawner/aev/decrepit/spawn_vehicle()
	var/obj/vehicle/multitile/tank/aev/AEV = new(loc)

	load_misc(AEV)
	handle_direction(AEV)
	load_hardpoints(AEV)
	load_damage(AEV)
	AEV.update_icon()
