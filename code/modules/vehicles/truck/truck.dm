/obj/vehicle/multitile/civtruck
	name = "civilian truck"
	desc = "A rather cheap hunk of metal with some wheels, you know what to do. Entrance on the sides."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_WEAK

	icon = 'icons/obj/vehicles/civtruck.dmi'
	icon_state = "civtruck_1"

	bound_width = 64
	bound_height = 64

	bound_x = 0
	bound_y = 0


	interior_map = /datum/map_template/interior/truck
	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0)
	)

	movement_sound = 'sound/vehicles/heavytruck_driving.mp3'

	luminosity = 6

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/civtruck
	)

/obj/vehicle/multitile/civtruck/civtruck_2
	name = "civilian truck"
	icon_state = "civtruck_2"

/obj/vehicle/multitile/civtruck/civtruck_3
	name = "civilian truck"
	icon_state = "civtruck_3"

/*
** PRESETS SPAWNERS
*/
