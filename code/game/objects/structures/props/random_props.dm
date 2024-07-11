/obj/structure/prop/random_props
	name = "random prop"
	desc = "laugh at the mapper who fucked up"
	icon = 'icons/obj/structures/props/random_props.dmi'
	icon_state = "hybrisa"
	bound_width = 32
	bound_height = 32
	density = TRUE
	health = 100
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	projectile_coverage = 20
	throwpass = TRUE

//---furniture---\\

//utility items
/obj/structure/prop/random_props/cabinet
	name = "Metal Side Cabinet"
	desc = "Small metal cabinet. Whatever is inside will remain a mystery, as the drawer is dented and warped, rendering unable to be opened."
	icon_state = "sidecabinet"

/obj/structure/prop/random_props/coffee
	name = "Coffee Machine"
	desc = "A coffee machine"
	icon_state = "coffee"


//beds
/obj/structure/prop/random_props/bunkbed
	name = "Bunk-Bed"
	desc = "An uncomfortable looking bed arrangement frequently found in high density living settings. I CALL DIBS ON THE TOP ONE!"
	icon_state = "zbunkbed"

/obj/structure/prop/random_props/bunkbed2
	name = "Bunk-Bed"
	icon_state = "zbunkbed2"

/obj/structure/prop/random_props/bunkbed3
	name = "Bunk-Bed"
	icon_state = "zbunkbed3"

/obj/structure/prop/random_props/bunkbed4
	name = "Bunk-Bed"
	icon_state = "zbunkbed4"

/obj/structure/prop/random_props/bunkbed5
	name = "Prison Bunk-Bed"
	icon_state = "prisonbed"

//hospital
/obj/structure/prop/random_props/med_curtain
	name = "Hospital Curtain"
	desc = "A privacy curtain used in hospitals to obscure patients and operations, or divide larger 	rooms."
	icon_state = "hospitalcurtain"


//-----Road stuff-----\\

//manhole
/obj/structure/prop/random_props/manhole
	density = 0
	name = "Man hole"
	desc = "An access point to the underground service tunnels."
	icon_state = "wymanhole"

/obj/structure/prop/random_props/manhole/o
	desc = "An access point to the underground service tunnels."
	icon_state = "wymanhole_open"

/obj/structure/prop/random_props/manhole/maint
	desc = "An access point to the underground service tunnels."
	icon_state = "maintenancehatch_alt"

/obj/structure/prop/random_props/manhole/maint_o
	desc = "An access point to the underground service tunnels."
	icon_state = "maintenancehatch_alt_open"

//Stock barriers
/obj/structure/barricade/handrail/roadbarrier
	name = "Road barrier"
	desc = "A Plastic Road barrier. Seeing one tends to indicate danger, death or construction."
	icon = 'icons/obj/structures/props/random_props.dmi'
	icon_state = "roadbarrier"
	stack_type = /obj/item/stack/sheet/mineral/plastic
	debris = list(/obj/item/stack/sheet/mineral/plastic)

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_cnct
	name = "Road barrier"
	desc = "A Plastic Road barrier. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrierjoined"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_long
	name = "Road barrier"
	desc = "A plastic Road barrier. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrier4"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_wood
	name = "Wooden road barrier"
	desc = "A Wooden Road barrier. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrierwood"
	stack_type = /obj/item/stack/sheet/wood
	debris = list(/obj/item/stack/sheet/wood)

//CMB barriers

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_cmb
	name = "Police Road barrier"
	desc = "A Plastic Road barrier with police markings. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrier2"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_long_cmb
	name = "Road barrier"
	desc = "A Plastic Road barrier with police markings. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrier5"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_wood_cmb
	name = "Wooden Police road barrier"
	desc = "A Wooden Road barrier with police markings. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrierpolice"
	stack_type = /obj/item/stack/sheet/wood
	debris = list(/obj/item/stack/sheet/wood)

//W-Y barriers
/obj/structure/barricade/handrail/roadbarrier/roadbarrier_wy
	name = "Weyland Yutani Road barrier"
	desc = "A Plastic Road barrier with the Weyland Yutani logo. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrier3"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_cnct_wy
	name = "Weyland Yutani Road barrier"
	desc = "A Plastic Road barrier with the Weyland Yutani logo. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrierjoined3"

/obj/structure/barricade/handrail/roadbarrier/roadbarrier_long_wy
	name = "Road barrier"
	desc = "A Plastic Road barrier with the Weyland Yutani logo. Seeing one tends to indicate danger, death or construction."
	icon_state = "roadbarrier6"

//-----Urban Fluff-----\\

//trashcans

/obj/structure/prop/random_props/trashcan_green
	name = "Green Trashcan"
	desc = "A green trashcan"
	icon_state = "trashgreen"

/obj/structure/prop/random_props/trashcan_blue
	name = "Blue Trashcan"
	desc = "A blue trashcan"
	icon_state = "trashblue"

//electric grille

//-----Gallows-----\\

/obj/structure/prop/random_props/gallows
	name = "Hung Pair MLU Soldiers"
	desc = "A pair of MLU fighters hung for their crimes."
	icon = 'icons/obj/structures/props/gallows.dmi'
	icon_state = "gallows"
	bound_width = 128
	bound_height = 128

//---Streetlight---\\

/obj/structure/machinery/colony_floodlight/traffic
	lum_value = 2
	name = "traffic light"
	desc = "A traffic light"
	icon = 'icons/obj/structures/props/64x64_randomprops.dmi'
	icon_state = "trafficlight"
	bound_width = 32
	bound_height = 64
	density = TRUE
	health = 200
	layer = ABOVE_MOB_LAYER

/obj/structure/machinery/colony_floodlight/traffic/update_icon()
	if(damaged)
		icon_state = "trafficlight_damaged"
	else if(is_lit )
		icon_state = "trafficlight_on"
	else
		icon_state = "trafficlight"

/obj/structure/machinery/colony_floodlight/traffic/alt
	icon_state = "trafficlight_alt"

/obj/structure/machinery/colony_floodlight/traffic/alt/update_icon()
	if(damaged)
		icon_state = "trafficlight_alt_damaged"
	else if(is_lit)
		icon_state = "trafficlight_alt_on"
	else
		icon_state = "trafficlight_alt"
