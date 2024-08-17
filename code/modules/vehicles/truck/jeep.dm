/obj/vehicle/multitile/van/miljeep
	name = "military jeep"
	desc = "A rather cheap hunk of metal with some wheels, you know what to do. Entrance on the sides."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_WEAK

	icon = 'icons/obj/vehicles/jeep.dmi'
	icon_state = "jeep"
	pixel_x = 0
	pixel_y = 0

	bound_width = 64
	bound_height = 64

	bound_x = 0
	bound_y = 0


	interior_map = /datum/map_template/interior/jeep
	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

	movement_sound = 'sound/vehicles/jeep_driving.mp3'
	honk_sound = 'sound/vehicles/old_car_horn.mp3'
	passengers_slots = 6
	xenos_slots = 4

	misc_multipliers = list(
		"move" = 1, // fucking annoying how this is the only way to modify speed
		"accuracy" = 1,
		"cooldown" = 1
	)

	luminosity = 5

	health = 500

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/jeep
	)

//=cmd apc
/obj/vehicle/multitile/van/miljeep/cmd
	interior_map = /datum/map_template/interior/jeep_cmd


/*
** PRESETS SPAWNERS
*/
