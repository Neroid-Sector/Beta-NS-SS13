/obj/vehicle/multitile/minitruck
	name = "civilian truck"
	desc = "A rather cheap hunk of metal with some wheels, you know what to do. Entrance on the sides."

	layer = ABOVE_XENO_LAYER
	vehicle_flags = VEHICLE_CLASS_WEAK

	icon = 'icons/obj/vehicles/minitruck.dmi'
	icon_state = "minitruck"

	bound_width = 96
	bound_height = 96

	bound_x = 0
	bound_y = 0


	interior_map = /datum/map_template/interior/minitruck
	entrances = list(
		"left" = list(2, 0),
		"right" = list(-1, 0),
		"back_left" = list(1, 2),
		"back_right" = list(0, 2)
	)

	movement_sound = 'sound/vehicles/heavytruck_driving.mp3'
	passengers_slots = 13
	xenos_slots = 4

	luminosity = 6

	move_max_momentum = 3
	move_turn_momentum_loss_factor = 1

	hardpoints_allowed = list(
		/obj/item/hardpoint/locomotion/truck/wheels/minitruck
	)
