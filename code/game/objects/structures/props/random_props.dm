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

//-----Whiteboard-----\\

/obj/structure/prop/random_props/whiteboard
	name = "Whiteboard"
	desc = "A board with some carefully picked information and plans drawn and pinned to it. Used as a visual aid during informational briefings"
	icon_state = "whiteboard"
	anchored = FALSE

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
	name = "Hung Pair of MLU Soldiers"
	desc = "A pair of MLU fighters hung for their crimes."
	icon = 'icons/obj/structures/props/gallows.dmi'
	icon_state = "gallows"
	bound_width = 128
	bound_height = 128

//-----Stakes-----\\

/obj/structure/prop/random_props/stakes
	name = "Staked MLU Soldiers"
	desc = "A group of slain MLU fighters tied to stakes. A properly Gruesome warning."
	icon = 'icons/obj/structures/props/gallows.dmi'
	icon_state = "stakes"
	bound_width = 128
	bound_height = 128

//-----Statues-----\\

/obj/structure/prop/random_props/statue
	name = "Statue root object. WHY THE FUCK AM I HERE DEV MAN!"
	desc = " Im the root statue. mock the mapper/admin for not changing this"
	icon = 'icons/obj/structures/props/lrgstatues.dmi'
	icon_state = "marina_statue"
	bound_width = 128
	bound_height = 128

//-marina goddess
/obj/structure/prop/random_props/statue/marina
	name = "Statue of Marina Prime"
	desc = "A large overgrown stone statue of the Sons of Marina's goddess. The face is twisted into an unsettling expression, and a large 'tail?' made of iron curls from beneath the stone statue's dress. In one hand the statue holds a stone sword with words inscribed in an unknown language. Staring at it makes you uncomfortable."
	desc_lore = "A statue of the Sons of Marina's goddess. When questioned as to how it was built, the Cultists claim to have no knowledge of who built it, or what the words on the sword say. Further study of the statue shows no signs of tools, hands or other traditional methods used in it's manufacture. It's almost as if the stone grew into that shape on its own."
	icon_state = "marina_statue"
	bound_width = 64
	bound_height = 64

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
