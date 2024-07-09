//------------WHISKEY OUTPOST VENDOR VEERSIONS---------------

//------------UNIFORM VENDOR---------------

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/wo
	req_access = list()
	req_one_access = list()

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/wo/populate_product_list(scale)
	listed_products = list(
		list("UNIFORM", -1, null, null),
		list("Lightweight IMP Backpack", 10, /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("M276 Ammo Load Rig", 10, /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", 10, /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 10, /obj/item/storage/belt/gun/m39, VENDOR_ITEM_REGULAR),
		list("M276 M44 Holster Rig", 10, /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 10, /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 10, /obj/item/storage/belt/shotgun, VENDOR_ITEM_REGULAR),
		list("Marine Combat Boots", 20, /obj/item/clothing/shoes/marine, VENDOR_ITEM_REGULAR),
		list("USCM Satchel", 10, /obj/item/storage/backpack/marine/satchel, VENDOR_ITEM_REGULAR),
		list("USCM Uniform", 20, /obj/item/clothing/under/marine, VENDOR_ITEM_REGULAR),
		list("Technician Welder-Satchel", 10, /obj/item/storage/backpack/marine/engineerpack/satchel, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null),
		list("Construction Pouch", round(scale * 2), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 2), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Full)", round(scale * 5), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", round(scale * 2), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Flare Pouch", round(scale * 5), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 3), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 5), /obj/item/storage/pouch/magazine/large, VENDOR_ITEM_REGULAR),
		list("Medical Pouch", round(scale * 2), /obj/item/storage/pouch/medical, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 2), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Medkit Pouch", round(scale * 2), /obj/item/storage/pouch/medkit, VENDOR_ITEM_REGULAR),
		list("Sidearm Pouch", round(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Syringe Pouch", round(scale * 2), /obj/item/storage/pouch/syringe, VENDOR_ITEM_REGULAR),
		list("Tools Pouch", round(scale * 2), /obj/item/storage/pouch/tools, VENDOR_ITEM_REGULAR),

		list("RADIO HEADSETS", -1, null, null),
		list("Marine Alpha Radio Headset", 10, /obj/item/device/radio/headset/almayer/marine/alpha, VENDOR_ITEM_REGULAR),
		list("Marine Bravo Radio Headset", 10, /obj/item/device/radio/headset/almayer/marine/bravo, VENDOR_ITEM_REGULAR),
		list("Marine Charlie Radio Headset", 10, /obj/item/device/radio/headset/almayer/marine/charlie, VENDOR_ITEM_REGULAR),
		list("Marine Delta Radio Headset", 10, /obj/item/device/radio/headset/almayer/marine/delta, VENDOR_ITEM_REGULAR),

		list("GLOVES", -1, null, null),
		list("Marine Combat Gloves", 40, /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("M10 Pattern Marine Helmet", 20, /obj/item/clothing/head/helmet/marine, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Carrier Marine Armor", 20, /obj/item/clothing/suit/storage/marine/carrier, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Padded Marine Armor", 20, /obj/item/clothing/suit/storage/marine/padded, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Padless Marine Armor", 20, /obj/item/clothing/suit/storage/marine/padless, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Ridged Marine Armor", 20, /obj/item/clothing/suit/storage/marine/padless_lines, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Skull Marine Armor", 20, /obj/item/clothing/suit/storage/marine/skull, VENDOR_ITEM_REGULAR),
		list("M3 Pattern Smooth Marine Armor", 20, /obj/item/clothing/suit/storage/marine/smooth, VENDOR_ITEM_REGULAR),
		list("M3-EOD Pattern Heavy Armor", 10, /obj/item/clothing/suit/storage/marine/heavy, VENDOR_ITEM_REGULAR),

		list("ENVIROMENTAL GEAR", -1, null, null, null),
		list("Gas Mask", 20, /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 10, /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Earplugs", round(scale * 5), /obj/item/clothing/ears/earmuffs/earplugs, VENDOR_ITEM_REGULAR),
		list("USCM Poncho", round(scale * 10), /obj/item/clothing/accessory/poncho, VENDOR_ITEM_REGULAR),
		)

//------------WEAPON RACKS---------------

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad_prep/wo
	req_access = list()
	req_one_access = list()
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND | VEND_LOAD_AMMO_BOXES

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad_prep/wo/populate_product_list(scale)
	listed_products = list(
		list("PRIMARY FIREARMS", -1, null, null),
		list("M4RA Battle Rifle", round(scale * 10), /obj/item/weapon/gun/rifle/m4ra, VENDOR_ITEM_REGULAR),
		list("MK221 Tactical Shotgun", round(scale * 3), /obj/item/weapon/gun/shotgun/combat, VENDOR_ITEM_REGULAR),
		list("M39 Submachine Gun", round(scale * 30), /obj/item/weapon/gun/smg/m39, VENDOR_ITEM_REGULAR),
		list("M41A Pulse Rifle MK1", round(scale * 30), /obj/item/weapon/gun/rifle/m41aMK1, VENDOR_ITEM_REGULAR),

		list("PRIMARY AMMUNITION", -1, null, null),
		list("Box of Buckshot Shells (12g)", round(scale * 10), /obj/item/ammo_magazine/shotgun/buckshot, VENDOR_ITEM_REGULAR),
		list("Box of Flechette Shells (12g)", round(scale * 4), /obj/item/ammo_magazine/shotgun/flechette, VENDOR_ITEM_REGULAR),
		list("Box of Shotgun Slugs (12g)", round(scale * 10), /obj/item/ammo_magazine/shotgun/slugs, VENDOR_ITEM_REGULAR),
		list("M4RA HEAP Magazine (10x24mm)", round(scale * 25), /obj/item/ammo_magazine/rifle/m4ra/heap, VENDOR_ITEM_REGULAR),
		list("M39 HV HEAP Magazine (10x20mm)", round(scale * 25), /obj/item/ammo_magazine/smg/m39/heap, VENDOR_ITEM_REGULAR),
		list("M41A MK1 HEAP Magazine (10x24mm)", round(scale * 25), /obj/item/ammo_magazine/rifle/m41aMK1/heap, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null),
		list("88 Mod 4 Combat Pistol", round(scale * 25), /obj/item/weapon/gun/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Combat Revolver", round(scale * 25), /obj/item/weapon/gun/revolver/m44, VENDOR_ITEM_REGULAR),
		list("M4A3 Service Pistol", round(scale * 25), /obj/item/weapon/gun/pistol/m4a3, VENDOR_ITEM_REGULAR),
		list("M82F Flare Gun", round(scale * 5), /obj/item/weapon/gun/flare, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("88M4 AP Magazine (9mm)", round(scale * 25), /obj/item/ammo_magazine/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Speedloader (.44)", round(scale * 20), /obj/item/ammo_magazine/revolver, VENDOR_ITEM_REGULAR),
		list("M4A3 Magazine (9mm)", round(scale * 25), /obj/item/ammo_magazine/pistol, VENDOR_ITEM_REGULAR),

		list("ATTACHMENTS", -1, null, null),
		list("M39 Folding Stock", round(scale * 10), /obj/item/attachable/stock/smg/collapsible, VENDOR_ITEM_REGULAR),
		list("Mod 88 Folding Stock", round(scale * 10), /obj/item/attachable/stock/mod88, VENDOR_ITEM_REGULAR),
		list("Rail Flashlight", round(scale * 25), /obj/item/attachable/flashlight, VENDOR_ITEM_REGULAR),
		list("Underbarrel Flashlight Grip", round(scale * 10), /obj/item/attachable/flashlight/grip, VENDOR_ITEM_REGULAR),
		list("Underslung Grenade Launcher", round(scale * 25), /obj/item/attachable/attached_gun/grenade, VENDOR_ITEM_REGULAR), //They already get these as on-spawns, might as well formalize some spares.

		list("UTILITIES", -1, null, null),
		list("Earplugs", round(scale * 5), /obj/item/clothing/ears/earmuffs/earplugs, VENDOR_ITEM_REGULAR),
		list("M5 Bayonet", round(scale * 25), /obj/item/attachable/bayonet, VENDOR_ITEM_REGULAR),
		list("M11 Throwing Knife", round(scale * 10), /obj/item/weapon/throwing_knife, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_REGULAR)
	)

//------------REQ AMMUNITION VENDOR---------------
/obj/structure/machinery/cm_vending/sorted/cargo_ammo/wo
	req_access = list(ACCESS_MARINE_CARGO)
	req_one_access = list()

/obj/structure/machinery/cm_vending/sorted/cargo_ammo/wo/populate_product_list(scale)
	listed_products = list(
		list("REGULAR AMMUNITION", -1, null, null),
		list("M4RA AP magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m4ra/ap, VENDOR_ITEM_REGULAR),
		list("M39 HEAP Magazine (10x20mm)", round(scale * 10), /obj/item/ammo_magazine/smg/m39/heap, VENDOR_ITEM_REGULAR),
		list("M41A MK1 HEAP Magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m41aMK1/heap, VENDOR_ITEM_REGULAR),
		list("M44 Speed Loader (.44)", round(scale * 10), /obj/item/ammo_magazine/revolver, VENDOR_ITEM_REGULAR),
		list("M4A3 Magazine (9mm)", round(scale * 10), /obj/item/ammo_magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Box Of Buckshot Shells", round(scale * 5), /obj/item/ammo_magazine/shotgun/buckshot, VENDOR_ITEM_REGULAR),
		list("Box Of Flechette Shells", round(scale * 5), /obj/item/ammo_magazine/shotgun/flechette, VENDOR_ITEM_REGULAR),
		list("Box Of Shotgun Slugs", round(scale * 5), /obj/item/ammo_magazine/shotgun/slugs, VENDOR_ITEM_REGULAR),

		list("RIOT AMMUNITION", -1, null, null),
		list("M4RA Rubber magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m4ra/rubber, VENDOR_ITEM_REGULAR),
		list("M39 Rubber Magazine (10x20mm)", round(scale * 10), /obj/item/ammo_magazine/smg/m39/rubber, VENDOR_ITEM_REGULAR),
		list("M41A MK1 Rubber Magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/rubber, VENDOR_ITEM_REGULAR),
		list("Box Of Beanbag Shells", round(scale * 5), /obj/item/ammo_magazine/shotgun/beanbag, VENDOR_ITEM_REGULAR),
		list("m15 Stun Grenade", round(scale * 10), /obj/item/explosive/grenade/high_explosive/m15/rubber, VENDOR_ITEM_REGULAR),
		list("m40 Stun Grenade", round(scale * 10), /obj/item/explosive/grenade/flashbang/noskill, VENDOR_ITEM_REGULAR),

		list("ARMOR-PIERCING AMMUNITION", -1, null, null),
		list("88 Mod 4 AP Magazine (9mm)", round(scale * 5), /obj/item/ammo_magazine/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M4RA HEAP Magazine (10x24mm)", round(scale * 15), /obj/item/ammo_magazine/rifle/m4ra/heap, VENDOR_ITEM_REGULAR),
		list("M39 AP Magazine (10x20mm)", round(scale * 5), /obj/item/ammo_magazine/smg/m39/ap, VENDOR_ITEM_REGULAR),
		list("M41A MK1 AP Magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m41aMK1/ap, VENDOR_ITEM_REGULAR),
		list("M4A3 AP Magazine (9mm)", round(scale * 5), /obj/item/ammo_magazine/pistol/ap, VENDOR_ITEM_REGULAR),

		list("EXTENDED AMMUNITION", -1, null, null),
		list("M39 Extended Magazine (10x20mm)", round(scale * 10), /obj/item/ammo_magazine/smg/m39/extended, VENDOR_ITEM_REGULAR),
		list("88 Mod FMJ Extended Magazine (9mm)", round(scale * 10), /obj/item/ammo_magazine/pistol/mod88/normalpoint/extended, VENDOR_ITEM_REGULAR),

		list("INCENDIARY AMMUNITION", -1, null, null),
		list("M4RA Incendiary Magazine (10x24mm)", round(scale * 3), /obj/item/ammo_magazine/rifle/m4ra/incendiary, VENDOR_ITEM_REGULAR),
		list("M39 Incendiary Magazine (10x20mm)", round(scale * 2), /obj/item/ammo_magazine/smg/m39/incendiary, VENDOR_ITEM_REGULAR),
		list("M41A MK2 Incendiary Magazine (10x24mm)", round(scale * 3), /obj/item/ammo_magazine/rifle/incendiary, VENDOR_ITEM_REGULAR),
		list("M4A3 Incendiary Magazine (9mm)", round(scale * 1), /obj/item/ammo_magazine/pistol/incendiary, VENDOR_ITEM_REGULAR),

		list("SPECIAL AMMUNITION", -1, null, null),
		list("Incinerator Tank", round(scale * 2.5), /obj/item/ammo_magazine/flamer_tank, VENDOR_ITEM_REGULAR),
		list("M41AE2 Ammo Box (10x24mm)", round(scale * 5), /obj/item/ammo_magazine/rifle/lmg, VENDOR_ITEM_REGULAR),
		list("M44 Heavy Speed Loader (.44)", round(scale * 2), /obj/item/ammo_magazine/revolver/heavy, VENDOR_ITEM_REGULAR),
		list("M44 Marksman Speed Loader (.44)", round(scale * 2), /obj/item/ammo_magazine/revolver/marksman, VENDOR_ITEM_REGULAR),
		list("M4A3 HP Magazine (9mm)", round(scale * 5), /obj/item/ammo_magazine/pistol/hp, VENDOR_ITEM_REGULAR),
		list("M56 Battery", round(scale * 5), /obj/item/smartgun_battery, VENDOR_ITEM_REGULAR),
		list("M56 Smartgun Drum", round(scale * 2), /obj/item/ammo_magazine/smartgun, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol Magazine (.45)", round(scale * 6), /obj/item/ammo_magazine/pistol/smart, VENDOR_ITEM_REGULAR),
		list("VP78 Magazine", round(scale * 6), /obj/item/ammo_magazine/pistol/vp78, VENDOR_ITEM_REGULAR),

		list("EXTRA SCOUT AMMUNITION", -1, null, null, null),
		list("A19 High Velocity Impact Magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m4ra/custom/impact, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Incendiary Magazine (10x24mm)", round(scale * 10), /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary, VENDOR_ITEM_REGULAR),
		list("A19 High Velocity Magazine (10x24mm)", round(scale * 15), /obj/item/ammo_magazine/rifle/m4ra/custom, VENDOR_ITEM_REGULAR),

		list("EXTRA SNIPER AMMUNITION", -1, null, null, null),
		list("M42A Flak Magazine (10x28mm)", round(scale * 10), /obj/item/ammo_magazine/sniper/flak, VENDOR_ITEM_REGULAR),
		list("M42A Incendiary Magazine (10x28mm)", round(scale * 10), /obj/item/ammo_magazine/sniper/incendiary, VENDOR_ITEM_REGULAR),
		list("M42A Marksman Magazine (10x28mm Caseless)", round(scale * 15), /obj/item/ammo_magazine/sniper, VENDOR_ITEM_REGULAR),

		list("EXTRA DEMOLITIONIST AMMUNITION", -1, null, null, null),
		list("84mm Anti-Armor Rocket", round(scale * 10), /obj/item/ammo_magazine/rocket/ap, VENDOR_ITEM_REGULAR),
		list("84mm High-Explosive Rocket", round(scale * 10), /obj/item/ammo_magazine/rocket, VENDOR_ITEM_REGULAR),
		list("84mm White-Phosphorus Rocket", round(scale * 10), /obj/item/ammo_magazine/rocket/wp, VENDOR_ITEM_REGULAR),

		list("EXTRA GRENADES", -1, null, null, null),
		list("M40 HEDP Grenade Pack (x6)", round(scale * 1.5), /obj/effect/essentials_set/hedp_6_pack, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Grenade Pack (x6)", round(scale * 1.5), /obj/effect/essentials_set/hidp_6_pack, VENDOR_ITEM_REGULAR),
		list("M74 AGM-F Grenade Pack (x6)", round(scale * 1.5), /obj/effect/essentials_set/agmf_6_pack, VENDOR_ITEM_REGULAR),
		list("M74 AGM-I Grenade Pack (x6)", round(scale * 1.5), /obj/effect/essentials_set/agmi_6_pack, VENDOR_ITEM_REGULAR),

		list("EXTRA FLAMETHROWER TANKS", -1, null, null, null),
		list("Large Incinerator Tank", round(scale * 1), /obj/item/ammo_magazine/flamer_tank/large, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (B) (Green Flame)", round(scale * 1), /obj/item/ammo_magazine/flamer_tank/large/B, VENDOR_ITEM_REGULAR),
		list("Large Incinerator Tank (X) (Blue Flame)", round(scale * 1), /obj/item/ammo_magazine/flamer_tank/large/X, VENDOR_ITEM_REGULAR),

		list("AMMUNITION BOXES", -1, null, null),
		list("Rifle Ammunition Box (10x24mm)", round(scale * 0.9), /obj/item/ammo_box/rounds/heap, VENDOR_ITEM_REGULAR),
		list("Rifle Ammunition Box (10x24mm AP)", round(scale * 0.75), /obj/item/ammo_box/rounds/ap, VENDOR_ITEM_REGULAR),
		list("SMG Ammunition Box (10x20mm AP)", round(scale * 0.75), /obj/item/ammo_box/rounds/smg/ap, VENDOR_ITEM_REGULAR),
		)

/obj/structure/machinery/cm_vending/sorted/cargo_ammo/wo/blend
		icon_state = "req_ammo_wall"
		tiles_with = list(
			/obj/structure/window/framed/almayer,
			/obj/structure/machinery/door/airlock,
			/turf/closed/wall/almayer)

//------------ARMAMENTS VENDOR---------------

/obj/structure/machinery/cm_vending/sorted/cargo_guns/wo
	req_access = list(ACCESS_MARINE_CARGO)

/obj/structure/machinery/cm_vending/sorted/cargo_guns/wo/populate_product_list(scale)
	listed_products = list(
		list("PRIMARY FIREARMS", -1, null, null),
		list("M4RA Battle Rifle", round(scale * 20), /obj/item/weapon/gun/rifle/m4ra, VENDOR_ITEM_REGULAR),
		list("M39 Submachinegun", round(scale * 15), /obj/item/weapon/gun/smg/m39, VENDOR_ITEM_REGULAR),
		list("M41A Pulse Rifle MK1", round(scale * 20), /obj/item/weapon/gun/rifle/m41aMK1, VENDOR_ITEM_REGULAR),
		list("MK221 Tactical Shotgun", round(scale * 3), /obj/item/weapon/gun/shotgun/combat, VENDOR_ITEM_REGULAR),

		list("SIDEARMS", -1, null, null),
		list("88 Mod 4 Combat Pistol", round(scale * 15), /obj/item/weapon/gun/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Combat Revolver", round(scale * 10), /obj/item/weapon/gun/revolver/m44, VENDOR_ITEM_REGULAR),
		list("M4A3 Service Pistol", round(scale * 20), /obj/item/weapon/gun/pistol/m4a3, VENDOR_ITEM_REGULAR),
		list("SU-6 Smartpistol", round(scale * 2), /obj/item/weapon/gun/pistol/smart, VENDOR_ITEM_REGULAR),
		list("M82F Flare Gun", round(scale * 5), /obj/item/weapon/gun/flare, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", -1, null, null),
		list("VP78 Pistol", round(scale * 4), /obj/item/storage/box/guncase/vp78, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", round(scale * 3), /obj/item/storage/box/guncase/smartpistol, VENDOR_ITEM_REGULAR),
		list("M41AE2 Heavy Pulse Rifle", round(scale * 2), /obj/item/storage/box/guncase/lmg, VENDOR_ITEM_REGULAR),
		list("M56D Heavy Machine Gun", round(scale * 2), /obj/item/storage/box/guncase/m56d, VENDOR_ITEM_REGULAR),
		list("M2C Heavy Machine Gun", round(scale * 2), /obj/item/storage/box/guncase/m2c, VENDOR_ITEM_REGULAR),
		list("M240 Incinerator Unit", round(scale * 2), /obj/item/storage/box/guncase/flamer, VENDOR_ITEM_REGULAR),
		list("M42A Sniper Rifle", round(scale * 2), /obj/item/weapon/gun/rifle/sniper/M42A, VENDOR_ITEM_REGULAR),
		list("M5 RPG", round(scale * 2), /obj/item/weapon/gun/launcher/rocket, VENDOR_ITEM_REGULAR),
		list("M92 Grenade Launcher", round(scale * 1), /obj/item/weapon/gun/launcher/grenade/m92, VENDOR_ITEM_REGULAR),
		list("Pyro Specialization Kit", round(scale * 1), /obj/item/storage/box/spec/pyro, VENDOR_ITEM_REGULAR),
		list("Smartgunner m56 weapon system Kit", round(scale * 1),/obj/item/storage/box/m56_system, VENDOR_ITEM_REGULAR),
		list("Heavy Armor Specialization Kit", round(scale * 0.5), /obj/item/storage/box/spec/B18, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", -1, null, null),
		list("M15 Fragmentation Grenade", round(scale * 2), /obj/item/explosive/grenade/high_explosive/m15, VENDOR_ITEM_REGULAR),
		list("M20 Claymore Anti-Personnel Mine", round(scale * 5), /obj/item/explosive/mine, VENDOR_ITEM_REGULAR),
		list("M40 HEDP Grenade Box", round(scale * 1), /obj/item/storage/box/nade_box, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Grenade", round(scale * 3), /obj/item/explosive/grenade/incendiary, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Grenade", round(scale * 5), /obj/item/explosive/grenade/smokebomb, VENDOR_ITEM_REGULAR),

		list("BACKPACKS", -1, null, null),
		list("Lightweight IMP Backpack", round(scale * 15), /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("Shotgun Scabbard", round(scale * 10), /obj/item/storage/large_holster/m37, VENDOR_ITEM_REGULAR),
		list("Pyrotechnician G4-1 Fueltank", round(scale * 2), /obj/item/storage/backpack/marine/engineerpack/flamethrower/kit, VENDOR_ITEM_REGULAR),
		list("Technician Welderpack", round(scale * 2), /obj/item/storage/backpack/marine/engineerpack, VENDOR_ITEM_REGULAR),
		list("Mortar Shell Backpack", round(scale * 1), /obj/item/storage/backpack/marine/mortarpack, VENDOR_ITEM_REGULAR),
		list("Technician Welder-Satchel", round(scale * 5), /obj/item/storage/backpack/marine/engineerpack/satchel, VENDOR_ITEM_REGULAR),
		list("IMP Ammo Rack", round(scale * 2), /obj/item/storage/backpack/marine/ammo_rack, VENDOR_ITEM_REGULAR),
		list("Radio Telephone Pack", round(scale * 2), /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),
		list("USCM Thermal Cape", round(scale * 1), /obj/item/storage/backpack/marine/satchel/scout_cloak, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("G8-A General Utility Pouch", round(scale * 2), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),
		list("M276 Ammo Load Rig", round(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 General Pistol Holster Rig", round(scale * 10), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig", round(scale * 5), /obj/item/storage/belt/knifepouch, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/m39, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig", round(scale * 2), /obj/item/storage/belt/grenade, VENDOR_ITEM_REGULAR),
		list("M276 M44 Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", round(scale * 2), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", round(scale * 10), /obj/item/storage/belt/shotgun, VENDOR_ITEM_REGULAR),
		list("M276 Mortar Operator Belt", round(scale * 2), /obj/item/storage/belt/gun/mortarbelt, VENDOR_ITEM_REGULAR),
		list("Rappel Harness", round(scale * 20), /obj/item/rappel_harness, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Black Webbing Vest", round(scale * 5), /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", round(scale * 5), /obj/item/clothing/accessory/storage/black_vest/brown_vest, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(scale * 5), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),
		list("Webbing", round(scale * 5), /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Knife Webbing", round(scale * 3), /obj/item/clothing/accessory/storage/knifeharness, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", round(scale * 5), /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null),
		list("Autoinjector Pouch", round(scale * 1), /obj/item/storage/pouch/autoinjector, VENDOR_ITEM_REGULAR),
		list("Medical Kit Pouch", round(scale * 2), /obj/item/storage/pouch/medkit, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Full)", round(scale * 5), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch", round(scale * 2), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Syringe Pouch", round(scale * 2), /obj/item/storage/pouch/syringe, VENDOR_ITEM_REGULAR),
		list("Tools Pouch (Full)", round(scale * 2), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(scale * 2), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Electronics Pouch", round(scale * 2), /obj/item/storage/pouch/electronics, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 2), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", round(scale * 5), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(scale * 2), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", round(scale * 2), /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", round(scale * 0.5), /obj/item/storage/pouch/machete/full, VENDOR_ITEM_REGULAR),
		list("Bayonet Pouch", round(scale * 2), /obj/item/storage/pouch/bayonet, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 2), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 5), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", round(scale * 5), /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Sidearm Pouch", round(scale * 5), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 5), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", round(scale * 4), /obj/item/storage/pouch/flamertank, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", round(scale * 1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Large Magazine Pouch", round(scale * 1), /obj/item/storage/pouch/magazine/large, VENDOR_ITEM_REGULAR),
		list("Large Shotgun Shell Pouch", round(scale * 1), /obj/item/storage/pouch/shotgun/large, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null),
		list("Earplugs", round(scale * 35), /obj/item/clothing/ears/earmuffs/earplugs, VENDOR_ITEM_REGULAR),
		list("Combat Flashlight", round(scale * 5), /obj/item/device/flashlight/combat, VENDOR_ITEM_REGULAR),
		list("Entrenching Tool", round(scale * 4), /obj/item/tool/shovel/etool/folded, VENDOR_ITEM_REGULAR),
		list("Gas Mask", round(scale * 10), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("M89-S Signal Flare Pack", round(scale * 2), /obj/item/storage/box/m94/signal, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", round(scale * 6), /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Motion Detector", round(scale * 4), /obj/item/device/motiondetector, VENDOR_ITEM_REGULAR),
		list("Data Detector", round(scale * 4), /obj/item/device/motiondetector/intel, VENDOR_ITEM_REGULAR),
		list("Binoculars", round(scale * 2), /obj/item/device/binoculars, VENDOR_ITEM_REGULAR),
		list("Rangefinder", round(scale * 1), /obj/item/device/binoculars/range, VENDOR_ITEM_REGULAR),
		list("Laser Designator", round(scale * 1), /obj/item/device/binoculars/range/designator, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", round(scale * 3), /obj/item/clothing/glasses/welding, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", round(scale * 3), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("High-Capacity Power Cell", round(scale * 1), /obj/item/cell/high, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", round(scale * 1), /obj/item/stack/fulton, VENDOR_ITEM_REGULAR),
		list("Sentry Gun Network Laptop", 4, /obj/item/device/sentry_computer, VENDOR_ITEM_REGULAR),
		list("JTAC Pamphlet", round(scale * 1), /obj/item/pamphlet/skill/jtac, VENDOR_ITEM_REGULAR),
		list("Engineering Pamphlet", round(scale * 1), /obj/item/pamphlet/skill/engineer, VENDOR_ITEM_REGULAR),
		list("Powerloader Certification", round(scale * 0.1) + 1, /obj/item/pamphlet/skill/powerloader, VENDOR_ITEM_REGULAR),
		list("Spare PDT/L Battle Buddy Kit", round(scale * 4), /obj/item/storage/box/pdt_kit, VENDOR_ITEM_REGULAR),
		list("W-Y brand rechargeable mini-battery", round(scale * 3), /obj/item/cell/crap, VENDOR_ITEM_REGULAR),
		list("Automated Supply Beacon (Full)", round(scale * 1), /obj/item/device/whiskey_supply_beacon, VENDOR_ITEM_REGULAR),
		list("MB-6 Folding Barricades (x3)", round(scale * 1), /obj/item/stack/folding_barricade/three, VENDOR_ITEM_REGULAR),
		list("standard Poncho", round(scale * 10), /obj/item/clothing/accessory/poncho, VENDOR_ITEM_REGULAR),
		list("Night Vision Visor", round(scale * 10), /obj/item/device/helmet_visor/night_vision, VENDOR_ITEM_REGULAR),
		list("Welding Visor", round(scale * 10), /obj/item/device/helmet_visor/welding_visor, VENDOR_ITEM_REGULAR),
			)

/obj/structure/machinery/cm_vending/sorted/cargo_guns/wo/blend
	icon_state = "req_guns_wall"
	tiles_with = list(
		/obj/structure/window/framed/almayer,
		/obj/structure/machinery/door/airlock,
		/turf/closed/wall/almayer,
	)
