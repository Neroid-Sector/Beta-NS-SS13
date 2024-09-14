/obj/item/hardpoint/locomotion/apc_wheels
	name = "APC Wheels"
	desc = "Integral to the movement of the APC."
	icon = 'icons/obj/vehicles/hardpoints/apc.dmi'

	damage_multiplier = 0.15

	icon_state = "tires"
	disp_icon = "apc"
	disp_icon_state = "wheels"

	health = 500

	move_delay = VEHICLE_SPEED_SUPERFAST
	move_max_momentum = 2
	move_momentum_build_factor = 1.5
	move_turn_momentum_loss_factor = 0.5


/obj/item/hardpoint/locomotion/bmp_wheels
	name = "BMP Wheels"
	desc = "Integral to the movement of the APC."
	icon = 'icons/obj/vehicles/hardpoints/bmp.dmi'

	damage_multiplier = 0.15

	icon_state = "bmp_wheels"
	disp_icon = "bmp"
	disp_icon_state = "bmp_wheels"

	health = 500

	move_delay = VEHICLE_SPEED_SUPERFAST
	move_max_momentum = 2
	move_momentum_build_factor = 1.5
	move_turn_momentum_loss_factor = 0.5
