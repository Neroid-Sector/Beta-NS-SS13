//USCM AUTO RACKS

//MK1

/obj/structure/machinery/auto_rack/mk1/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/structure/machinery/auto_rack/mk1/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/structure/machinery/auto_rack/mk1/full/training
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1/training
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1/training

//M39----

/obj/structure/machinery/auto_rack/m39/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	stocked_weapon = /obj/item/weapon/gun/smg/m39
	restock_type = /obj/item/weapon/gun/smg/m39

/obj/structure/machinery/auto_rack/m39/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/smg/m39
	restock_type = /obj/item/weapon/gun/smg/m39

/obj/structure/machinery/auto_rack/m39/full/training
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/smg/m39/training
	restock_type = /obj/item/weapon/gun/smg/m39/training

//M4RA----

/obj/structure/machinery/auto_rack/m4ra/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA DMR."
	icon_state = "m4rarack"
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra
	restock_type = /obj/item/weapon/gun/rifle/m4ra

/obj/structure/machinery/auto_rack/m4ra/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA Pulse DMR."
	icon_state = "m4rarack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra
	restock_type = /obj/item/weapon/gun/rifle/m4ra

/obj/structure/machinery/auto_rack/m4ra/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA Pulse DMR."
	icon_state = "m4rarack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra/training
	restock_type = /obj/item/weapon/gun/rifle/m4ra/training

//Mk221----

/obj/structure/machinery/auto_rack/mk221/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat
	restock_type = /obj/item/weapon/gun/shotgun/combat

/obj/structure/machinery/auto_rack/mk221/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat
	restock_type = /obj/item/weapon/gun/shotgun/combat

/obj/structure/machinery/auto_rack/mk221/full/honorguard
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat/guard
	restock_type = /obj/item/weapon/gun/shotgun/combat/guard

/obj/structure/machinery/auto_rack/mk221/full/riot
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Riot Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat/riot
	restock_type = /obj/item/weapon/gun/shotgun/combat/riot




//----------------Special_item----------------\\

/obj/item/reqcard
	name = "Battalion budget Authorization card"
	desc = "Used to allocate funding to automated equipment vendors and weapon racks around the ship."
	icon = 'icons/obj/items/card.dmi'
	icon_state = "centcom_old"
	w_class = SIZE_TINY

