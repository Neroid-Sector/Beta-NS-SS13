/obj/structure/machinery/gear
	name = "\improper gear"
	icon_state = "gear"
	anchored = TRUE
	density = FALSE
	unslashable = TRUE
	unacidable = TRUE
	use_power = USE_POWER_NONE
	var/id

/obj/structure/machinery/gear/proc/start_moving(direction = NORTH)
	icon_state = "gear_moving"
	setDir(direction)

/obj/structure/machinery/gear/proc/stop_moving()
	icon_state = "gear"

/obj/structure/machinery/elevator_strut
	name = "\improper strut"
	icon = 'icons/turf/elevator_strut.dmi'
	anchored = TRUE
	unslashable = TRUE
	unacidable = TRUE
	density = FALSE
	use_power = USE_POWER_NONE
	opacity = TRUE
	layer = ABOVE_MOB_LAYER
	var/id

/obj/structure/machinery/elevator_strut/top
	icon_state = "strut_top"

/obj/structure/machinery/elevator_strut/bottom
	icon_state = "strut_bottom"

/obj/structure/machinery/elevator_strut/tower
	icon_state = "tower_strut"

/obj/structure/machinery/elevator_strut/tower/ladder
	name = "\improper ladder"
	icon_state = "ladder"


/obj/structure/machinery/elevator_strut/tower_tall
	icon = 'icons/turf/tower_base.dmi'

	icon_state = "tower_strut"

/obj/structure/machinery/elevator_strut/tower_tall/pillar_l
	icon_state = "pillar_left"

/obj/structure/machinery/elevator_strut/tower_tall/pillar_r
	icon_state = "pillar_right"

/obj/structure/machinery/elevator_strut/tower_tall/ladder
	name = "\improper ladder"
	icon_state = "ladder"
