//USCM AUTO RACKS
/obj/item/reqcard/uscm
	name = "USCM Battalion budget Authorization card"

/obj/structure/machinery/auto_rack/uscm
	budget_card = /obj/item/reqcard/uscm

//-----------------WEAPONS-----------------\\

//MK1

/obj/structure/machinery/auto_rack/uscm/mk1/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/structure/machinery/auto_rack/uscm/mk1/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/structure/machinery/auto_rack/uscm/mk1/full/training
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the m41aMK1 Pulse Rifle."
	icon_state = "mk1rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m41aMK1/training
	restock_type = /obj/item/weapon/gun/rifle/m41aMK1/training

//M39----

/obj/structure/machinery/auto_rack/uscm/m39/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	stocked_weapon = /obj/item/weapon/gun/smg/m39
	restock_type = /obj/item/weapon/gun/smg/m39

/obj/structure/machinery/auto_rack/uscm/m39/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/smg/m39
	restock_type = /obj/item/weapon/gun/smg/m39

/obj/structure/machinery/auto_rack/uscm/m39/full/training
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M39 Pulse Submachinegun."
	icon_state = "m39rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/smg/m39/training
	restock_type = /obj/item/weapon/gun/smg/m39/training

//M4RA----

/obj/structure/machinery/auto_rack/uscm/m4ra/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA DMR."
	icon_state = "m4rarack"
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra
	restock_type = /obj/item/weapon/gun/rifle/m4ra

/obj/structure/machinery/auto_rack/uscm/m4ra/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA Pulse DMR."
	icon_state = "m4rarack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra
	restock_type = /obj/item/weapon/gun/rifle/m4ra

/obj/structure/machinery/auto_rack/uscm/m4ra/full/training
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the M4RA Pulse DMR."
	icon_state = "m4rarack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/rifle/m4ra/training
	restock_type = /obj/item/weapon/gun/rifle/m4ra/training

//Mk221----

/obj/structure/machinery/auto_rack/uscm/mk221/empty
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat
	restock_type = /obj/item/weapon/gun/shotgun/combat

/obj/structure/machinery/auto_rack/uscm/mk221/full
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat
	restock_type = /obj/item/weapon/gun/shotgun/combat

/obj/structure/machinery/auto_rack/uscm/mk221/full/honorguard
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Combat Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat/guard
	restock_type = /obj/item/weapon/gun/shotgun/combat/guard

/obj/structure/machinery/auto_rack/uscm/mk221/full/riot
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold the mk221 Riot Shotgun."
	icon_state = "mk221rack"
	initial_stored = 4
	stocked_weapon = /obj/item/weapon/gun/shotgun/combat/riot
	restock_type = /obj/item/weapon/gun/shotgun/combat/riot

//-----------------Munitions-----------------\\

//Mk1----

/obj/structure/machinery/auto_rack/uscm/mk1_ammo/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M41aMK1 Magazine tins."
	icon_state = "mk1_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/mk1/heap
	restock_type = /obj/item/ammo_box/magazine/mk1/heap

/obj/structure/machinery/auto_rack/uscm/mk1_ammo/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M41aMK1 Magazine tins."
	icon_state = "mk1_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/mk1/heap
	restock_type = /obj/item/ammo_box/magazine/mk1/heap

//M4RA----

/obj/structure/machinery/auto_rack/uscm/m4ra_ammo/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M39 Magazine tins."
	icon_state = "m4ra_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/m4ra/heap
	restock_type = /obj/item/ammo_box/magazine/m4ra/heap

/obj/structure/machinery/auto_rack/uscm/m4ra_ammo/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M39 Magazine tins."
	icon_state = "m4ra_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/m4ra/heap
	restock_type = /obj/item/ammo_box/magazine/m4ra/heap

//M39----

/obj/structure/machinery/auto_rack/uscm/m39_ammo/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M39 Magazine tins."
	icon_state = "m39_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/m39/heap
	restock_type = /obj/item/ammo_box/magazine/m39/heap

/obj/structure/machinery/auto_rack/uscm/m39_ammo/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold M39 Magazine tins."
	icon_state = "m39_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/m39/heap
	restock_type = /obj/item/ammo_box/magazine/m39/heap

//Shotguns----

//buck
/obj/structure/machinery/auto_rack/uscm/buckshot/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold buckshot storage tins."
	icon_state = "buckshot_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun/buckshot
	restock_type = /obj/item/ammo_box/magazine/shotgun/buckshot

/obj/structure/machinery/auto_rack/uscm/buckshot/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold 12 gauge buckshot storage tins."
	icon_state = "buckshot_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun/buckshot
	restock_type = /obj/item/ammo_box/magazine/shotgun/buckshot

//slug

/obj/structure/machinery/auto_rack/uscm/slugs/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold 12 gauge slug storage tins."
	icon_state = "slugs_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun
	restock_type = /obj/item/ammo_box/magazine/shotgun

/obj/structure/machinery/auto_rack/uscm/slugs/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold 12 gauge slug storage tins."
	icon_state = "slugs_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun
	restock_type = /obj/item/ammo_box/magazine/shotgun

//beanbag

/obj/structure/machinery/auto_rack/uscm/beanbag/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold 12 gauge beanbag storage tins."
	icon_state = "beanbag_magrack"
	initial_stored = 4
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun/beanbag
	restock_type = /obj/item/ammo_box/magazine/shotgun/beanbag

/obj/structure/machinery/auto_rack/uscm/beanbag/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold 12 gauge beanbag storage tins."
	icon_state = "beanbag_magrack"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_box/magazine/shotgun/beanbag
	restock_type = /obj/item/ammo_box/magazine/shotgun/beanbag

//Smartgun----

/obj/structure/machinery/auto_rack/uscm/smartgun_ammo
	name = "THIS SHOULD NOT BE SPAWNED"
	desc = "The ARMAT brand munitions rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted. This one is configured to hold Smartgun ammo drums."
	max_stored = 8
	max_restocks = 1
	icon_state = "smartgun_magrack"

/obj/structure/machinery/auto_rack/uscm/smartgun_ammo/full
	name = "ColMarTech Automated Munitions Storage Carousel"
	initial_stored = 8
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_magazine/smartgun
	restock_type = /obj/item/ammo_magazine/smartgun

/obj/structure/machinery/auto_rack/uscm/smartgun_ammo/empty
	name = "ColMarTech Automated Munitions Storage Carousel"
	initial_stored = 0
	max_restocks = 1
	stocked_weapon = /obj/item/ammo_magazine/smartgun
	restock_type = /obj/item/ammo_magazine/smartgun

//-----------------Kit-Boxes-----------------\\



//-----------------Weapon-Boxes-----------------\\




