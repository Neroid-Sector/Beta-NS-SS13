//------------SQUAD RIFLEMAN UNIFORM AND GEAR VENDOR---------------

GLOBAL_LIST_INIT(cm_vending_clothing_marine, list(
		list("STANDARD EQUIPMENT (TAKE ALL)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/almayer/marine, /obj/item/clothing/head/helmet/marine), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MRE", 0, /obj/item/storage/box/MRE, MARINE_CAN_BUY_MRE, VENDOR_ITEM_MANDATORY),
		list("Map", 0, /obj/item/map/current_map, MARINE_CAN_BUY_KIT, VENDOR_ITEM_MANDATORY),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Light Armor", 0, /obj/item/clothing/suit/storage/marine/light, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Medium Armor", 0, /obj/item/clothing/suit/storage/marine/medium, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Heavy Armor", 0, /obj/item/clothing/suit/storage/marine/heavy, MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Backpack", 0, /obj/item/storage/backpack/marine, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Shotgun Scabbard", 0, /obj/item/storage/large_holster/m37, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("BELT (CHOOSE 1)", 0, null, null, null),
		list("M276 Ammo Load Rig", 0, /obj/item/storage/belt/marine, MARINE_CAN_BUY_BELT, VENDOR_ITEM_RECOMMENDED),
		list("M276 General Pistol Holster Rig", 0, /obj/item/storage/belt/gun/m4a3, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig (Full)", 0, /obj/item/storage/belt/knifepouch, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M39 Holster Rig", 0, /obj/item/storage/belt/gun/m39, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M44 Holster Rig", 0, /obj/item/storage/belt/gun/m44, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M82F Holster Rig", 0, /obj/item/storage/belt/gun/flaregun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 Shotgun Shell Loading Rig", 0, /obj/item/storage/belt/shotgun, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", 0, /obj/item/storage/backpack/general_belt, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),
		list("M276 M40 Grenade Rig (Empty)", 0, /obj/item/storage/belt/grenade, MARINE_CAN_BUY_BELT, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("Bayonet Sheath (Full)", 0, /obj/item/storage/pouch/bayonet, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", 0, /obj/item/storage/pouch/firstaid/full/alternate, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Small Document Pouch", 0, /obj/item/storage/pouch/document/small, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", 0, /obj/item/storage/pouch/general/medium, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", 0, /obj/item/storage/pouch/magazine/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", 0, /obj/item/storage/pouch/pistol, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("MASK (CHOOSE 1)", 0, null, null, null),
		list("Gas Mask", 0, /obj/item/clothing/mask/gas, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", 0, /obj/item/clothing/mask/rebreather/scarf, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),
		list("Rebreather", 0, /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("VP78 Pistol", 15, /obj/item/storage/box/guncase/vp78, null, VENDOR_ITEM_REGULAR),
		list("SU-6 Smart Pistol", 15, /obj/item/storage/box/guncase/smartpistol, null, VENDOR_ITEM_REGULAR),
		list("M79 Grenade Launcher", 30, /obj/item/storage/box/guncase/m79, null, VENDOR_ITEM_REGULAR),

		list("EXPLOSIVES", 0, null, null, null),
		list("M40 HEDP High Explosive Packet (x3 grenades)", 20, /obj/item/storage/box/packet/high_explosive, null, VENDOR_ITEM_REGULAR),
		list("M40 HIDP Incendiary Packet (x3 grenades)", 20, /obj/item/storage/box/packet/incendiary, null, VENDOR_ITEM_REGULAR),
		list("M40 HPDP White Phosphorus Packet (x3 grenades)", 20, /obj/item/storage/box/packet/phosphorus, null, VENDOR_ITEM_REGULAR),
		list("M40 HSDP Smoke Packet (x3 grenades)", 10, /obj/item/storage/box/packet/smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Frag Airburst Packet (x3 airburst grenades)", 15, /obj/item/storage/box/packet/airburst_he, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Incendiary Airburst Packet (x3 airburst grenades)", 15, /obj/item/storage/box/packet/airburst_incen, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Smoke Airburst Packet (x3 airburst grenades)", 10, /obj/item/storage/box/packet/airburst_smoke, null, VENDOR_ITEM_REGULAR),
		list("M74 AGM-Hornet Airburst Packet (x3 airburst grenades", 15, /obj/item/storage/box/packet/hornet, null, VENDOR_ITEM_REGULAR),
		list("M20 Mine Box (x4 mines)", 20, /obj/item/storage/box/explosive_mines, null, VENDOR_ITEM_REGULAR),

		list("AMMUNITION", 0, null, null, null),
		list("M4RA AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/m4ra/ap, null, VENDOR_ITEM_REGULAR),
		list("M39 AP Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/ap , null, VENDOR_ITEM_REGULAR),
		list("M39 Extended Magazine (10x20mm)", 10, /obj/item/ammo_magazine/smg/m39/extended , null, VENDOR_ITEM_REGULAR),
		list("M41A AP Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/ap , null, VENDOR_ITEM_REGULAR),
		list("M41A Extended Magazine (10x24mm)", 10, /obj/item/ammo_magazine/rifle/extended , null, VENDOR_ITEM_REGULAR),
		list("M44 Heavy Speed Loader (.44)", 10, /obj/item/ammo_magazine/revolver/heavy, null, VENDOR_ITEM_REGULAR),

		list("ARMORS", 0, null, null, null),
		list("M3 B12 Pattern Marine Armor", 30, /obj/item/clothing/suit/storage/marine/leader, null, VENDOR_ITEM_REGULAR),
		list("M4 Pattern Armor", 30, /obj/item/clothing/suit/storage/marine/rto, null, VENDOR_ITEM_REGULAR),

		list("CLOTHING ITEMS", 0, null, null, null),
		list("Webbing", 10, /obj/item/clothing/accessory/storage/webbing, null, VENDOR_ITEM_REGULAR),
		list("Brown Webbing Vest", 15, /obj/item/clothing/accessory/storage/black_vest/brown_vest, null, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", 15, /obj/item/clothing/accessory/storage/black_vest, null, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", 15, /obj/item/clothing/accessory/storage/droppouch, null, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", 15, /obj/item/clothing/accessory/storage/holster, null, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", 15, /obj/item/storage/large_holster/machete/full, null, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", 15, /obj/item/storage/pouch/machete/full, null, VENDOR_ITEM_REGULAR),
		list("USCM Radio Telephone Pack", 15, /obj/item/storage/backpack/marine/satchel/rto, null, VENDOR_ITEM_REGULAR),
		list("Fuel Tank Strap Pouch", 5, /obj/item/storage/pouch/flamertank, null, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", 5, /obj/item/clothing/glasses/welding, null, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", 15, /obj/item/storage/pouch/sling, null, VENDOR_ITEM_REGULAR),
		list("Large General Pouch", 15, /obj/item/storage/pouch/general/large, null, VENDOR_ITEM_REGULAR),

		list("UTILITIES", 0, null, null, null),
		list("E-Tool", 5, /obj/item/tool/shovel/etool/folded, null, VENDOR_ITEM_REGULAR),
		list("Sandbags", 20, /obj/item/stack/sandbags_empty/half, null, VENDOR_ITEM_REGULAR),
		list("Roller Bed", 5, /obj/item/roller, null, VENDOR_ITEM_REGULAR),
		list("Fulton Device Stack", 5, /obj/item/stack/fulton, null, VENDOR_ITEM_REGULAR),
		list("Range Finder", 10, /obj/item/device/binoculars/range, null, VENDOR_ITEM_REGULAR),
		list("Laser Designator", 15, /obj/item/device/binoculars/range/designator, null, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", 5, /obj/item/tool/extinguisher/mini, null, VENDOR_ITEM_REGULAR),
		list("Motion Detector", 15, /obj/item/device/motiondetector, null, VENDOR_ITEM_REGULAR),
		list("Data Detector", 15, /obj/item/device/motiondetector/intel, null, VENDOR_ITEM_REGULAR),
		list("Whistle", 5, /obj/item/device/whistle, null, VENDOR_ITEM_REGULAR),

		list("HELMET OPTICS", 0, null, null, null),
		list("Medical Helmet Optic", 15, /obj/item/device/helmet_visor/medical, null, VENDOR_ITEM_REGULAR),
		list("Welding Visor", 5, /obj/item/device/helmet_visor/welding_visor, null, VENDOR_ITEM_REGULAR),

		list("PAMPHLETS", 0, null, null, null),
		list("JTAC Pamphlet", 15, /obj/item/pamphlet/skill/jtac, null, VENDOR_ITEM_REGULAR),
		list("Engineering Pamphlet", 15, /obj/item/pamphlet/skill/engineer, null, VENDOR_ITEM_REGULAR),

		list("RADIO KEYS", 0, null, null, null),
		list("Engineering Radio Encryption Key", 5, /obj/item/device/encryptionkey/engi, null, VENDOR_ITEM_REGULAR),
		list("Intel Radio Encryption Key", 5, /obj/item/device/encryptionkey/intel, null, VENDOR_ITEM_REGULAR),
		list("JTAC Radio Encryption Key", 5, /obj/item/device/encryptionkey/jtac, null, VENDOR_ITEM_REGULAR),
		list("Supply Radio Encryption Key", 5, /obj/item/device/encryptionkey/req, null, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/clothing/marine
	name = "\improper ColMarTech Automated Marine Equipment Rack"
	desc = "An automated rack hooked up to a colossal storage of Marine Rifleman standard-issue equipment."
	icon_state = "mar_rack"
	show_points = TRUE
	vendor_theme = VENDOR_THEME_USCM

	vendor_role = list(JOB_SQUAD_MARINE)

/obj/structure/machinery/cm_vending/clothing/marine/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_marine

/obj/structure/machinery/cm_vending/clothing/marine/alpha
	squad_tag = SQUAD_MARINE_1
	req_access = list(ACCESS_MARINE_ALPHA)
	headset_type = /obj/item/device/radio/headset/almayer/marine/alpha

/obj/structure/machinery/cm_vending/clothing/marine/bravo
	squad_tag = SQUAD_MARINE_2
	req_access = list(ACCESS_MARINE_BRAVO)
	headset_type = /obj/item/device/radio/headset/almayer/marine/bravo

/obj/structure/machinery/cm_vending/clothing/marine/charlie
	squad_tag = SQUAD_MARINE_3
	req_access = list(ACCESS_MARINE_CHARLIE)
	headset_type = /obj/item/device/radio/headset/almayer/marine/charlie

/obj/structure/machinery/cm_vending/clothing/marine/delta
	squad_tag = SQUAD_MARINE_4
	req_access = list(ACCESS_MARINE_DELTA)
	headset_type = /obj/item/device/radio/headset/almayer/marine/delta



//------------UA CREW PREP VENDORS -------------------

//------------UA CREW PREP WEAPON RACKS---------------

/obj/structure/machinery/cm_vending/sorted/cargo_guns/uscss
	name = "\improper ColMarTech Automated Weapons Rack"
	desc = "An automated weapon rack hooked up to a big storage of standard-issue weapons."
	icon_state = "guns"
	req_access = list()
	req_one_access = list(ACCESS_MARINE_DATABASE, ACCESS_MARINE_PREP, ACCESS_MARINE_CARGO)
	hackable = TRUE
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND

/obj/structure/machinery/cm_vending/sorted/cargo_guns/uscss/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/cargo_guns/uscss/populate_product_list(scale)
	listed_products = list(
		list("SIDEARMS", -1, null, null),
		list("88 Mod 4 Combat Pistol", round(scale * 25), /obj/item/weapon/gun/pistol/mod88, VENDOR_ITEM_REGULAR),
		list("M44 Combat Revolver", round(scale * 25), /obj/item/weapon/gun/revolver/m44, VENDOR_ITEM_REGULAR),
		list("M4A3 Service Pistol", round(scale * 25), /obj/item/weapon/gun/pistol/m4a3, VENDOR_ITEM_REGULAR),
		list("M82F Flare Gun", round(scale * 10), /obj/item/weapon/gun/flare, VENDOR_ITEM_REGULAR),

		list("SIDEARM AMMUNITION", -1, null, null),
		list("88M4 Magazine (9mm)", round(scale * 25), /obj/item/ammo_magazine/pistol/mod88/normalpoint, VENDOR_ITEM_REGULAR),
		list("M44 Speedloader (.44)", round(scale * 20), /obj/item/ammo_magazine/revolver, VENDOR_ITEM_REGULAR),
		list("M4A3 Magazine (9mm)", round(scale * 25), /obj/item/ammo_magazine/pistol, VENDOR_ITEM_REGULAR),

		list("ATTACHMENTS", -1, null, null),
		list("Rail Flashlight", round(scale * 25), /obj/item/attachable/flashlight, VENDOR_ITEM_RECOMMENDED),
		list("Extended Barrel", round(scale * 2.5), /obj/item/attachable/extended_barrel, VENDOR_ITEM_REGULAR),
		list("Recoil Compensator", round(scale * 2.5), /obj/item/attachable/compensator, VENDOR_ITEM_REGULAR),
		list("Suppressor", round(scale * 2.5), /obj/item/attachable/suppressor, VENDOR_ITEM_REGULAR),

		list("UTILITIES", -1, null, null),
		list("M5 Bayonet", round(scale * 25), /obj/item/attachable/bayonet, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_RECOMMENDED)
	)

//------------UA CREW UNIFORM VENDOR---------------


/obj/structure/machinery/cm_vending/sorted/uniform_supply/uscss_prep
	name = "\improper ColMarTech Surplus Uniform Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard USCSS uniforms."
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/uscss_prep/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/uscss_prep/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Marine Combat Boots", round(scale * 15), /obj/item/clothing/shoes/marine, VENDOR_ITEM_REGULAR),
		list("USCM Uniform", round(scale * 15), /obj/item/clothing/under/marine, VENDOR_ITEM_REGULAR),
		list("UA Military Garb", round(scale * 15), /obj/item/clothing/under/colonist/ua_civvies, VENDOR_ITEM_REGULAR),
		list("Marine Combat Gloves", round(scale * 15), /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("Marine Black Combat Gloves", round(scale * 15), /obj/item/clothing/gloves/marine/black, VENDOR_ITEM_REGULAR),
		list("M10 Pattern Marine Helmet", round(scale * 15), /obj/item/clothing/head/helmet/marine, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Brown Webbing Vest", round(scale * 1.25), /obj/item/clothing/accessory/storage/black_vest/brown_vest, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Webbing", round(scale * 2), /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("ARMOR", -1, null, null),
		list("Balistics Vest", round(scale * 15), /obj/item/clothing/suit/storage/marine/light/vest, VENDOR_ITEM_REGULAR),
		list("Flak Vest", round(scale * 15), /obj/item/clothing/suit/storage/marine/light/vest/dcc, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight IMP Backpack", round(scale * 15), /obj/item/storage/backpack/marine, VENDOR_ITEM_REGULAR),
		list("Technician Backpack", round(scale * 15), /obj/item/storage/backpack/marine/tech, VENDOR_ITEM_REGULAR),
		list("Medical Backpack", round(scale * 15), /obj/item/storage/backpack/marine/medic, VENDOR_ITEM_REGULAR),
		list("USCM Satchel", round(scale * 15), /obj/item/storage/backpack/marine/satchel, VENDOR_ITEM_REGULAR),
		list("USCM Technical Satchel", round(scale * 15), /obj/item/storage/backpack/marine/satchel/tech, VENDOR_ITEM_REGULAR),
		list("USCM Technical Chestrig", round(scale * 15), /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, VENDOR_ITEM_REGULAR),
		list("Medical Satchel", round(scale * 15), /obj/item/storage/backpack/marine/satchel/medic, VENDOR_ITEM_REGULAR),
		list("Shotgun Scabbard", round(scale * 5), /obj/item/storage/large_holster/m37, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("USCM Technician Welderpack", round(scale * 1.25), /obj/item/storage/backpack/marine/engineerpack, VENDOR_ITEM_REGULAR),
		list("Technician Welder-Satchel", round(scale * 2), /obj/item/storage/backpack/marine/engineerpack/satchel, VENDOR_ITEM_REGULAR),
		list("Radio Telephone Backpack", round(max(1,(scale * 0.5))), /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("M276 Pattern Ammo Load Rig", round(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("M276 Pattern Shotgun Shell Loading Rig", round(scale * 15), /obj/item/storage/belt/shotgun, VENDOR_ITEM_REGULAR),
		list("M276 Pattern General Pistol Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M44 Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M276 Pattern M82F Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("M276 Knife Rig (Full)", round(scale * 15), /obj/item/storage/belt/knifepouch, VENDOR_ITEM_REGULAR),
		list("M276 G8-A General Utility Pouch", round(scale * 15), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Bayonet Sheath (Full)",round(scale * 15), /obj/item/storage/pouch/bayonet, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", round(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Small Document Pouch", round(scale * 15), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", round(scale * 15), /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(scale * 15), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", round(scale * 1.25), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 1.25), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch (Empty)", round(scale * 2.5), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", round(scale * 1.25), /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(scale * 15), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", round(scale * 10), /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Rebreather", round(scale * 10), /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("M1A1 Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/v2, VENDOR_ITEM_REGULAR),
		list("Prescription ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/prescription, VENDOR_ITEM_REGULAR),
		list("Marine RPG glasses", round(scale * 10), /obj/item/clothing/glasses/regular, VENDOR_ITEM_REGULAR),
		list("M5 Integrated Gas Mask", round(scale * 10), /obj/item/prop/helmetgarb/helmet_gasmask, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Netting", round(scale * 10), /obj/item/prop/helmetgarb/netting, VENDOR_ITEM_REGULAR),
		list("M10 Helmet Rain Cover", round(scale * 10), /obj/item/prop/helmetgarb/raincover, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("USCM Flair", round(scale * 15), /obj/item/prop/helmetgarb/flair_uscm, VENDOR_ITEM_REGULAR),
		)

//--------------Ship SPECIFIC VERSIONS--------------
//Those vendors aren't being used i will make them us the main vendor a parent to avoid having four different
// list with just the headset changed. - Moonshanks note, used to change the headset to the right ship.

//liberty star
/obj/structure/machinery/cm_vending/sorted/uniform_supply/uscss_prep/libertystar
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_LIBERTY_STAR, ACCESS_MARINE_DATABASE, ACCESS_MARINE_CARGO)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/alpha/populate_product_list(scale)
	listed_products += list(
		list("HEADSET", -1, null, null),
		list("Liberty Star Radio Headset", 25, /obj/item/device/radio/headset/almayer/marine/libertystar, VENDOR_ITEM_REGULAR),
		)

//aegis
/obj/structure/machinery/cm_vending/sorted/uniform_supply/uscss_prep/aegis
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_AEGIS, ACCESS_MARINE_DATABASE, ACCESS_MARINE_CARGO)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/alpha/populate_product_list(scale)
	listed_products += list(
		list("HEADSET", -1, null, null),
		list("Aegis Radio Headset", 25, /obj/item/device/radio/headset/almayer/marine/aegis, VENDOR_ITEM_REGULAR),
		)



//--------------SQUAD ARMAMENTS VENDOR--------------

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad
	name = "\improper ColMarTech Automated Utilities Squad Vendor"
	desc = "An automated supply rack hooked up to a small storage of various utilities and tools. Can be accessed by any Marine Rifleman."
	req_access = list(ACCESS_MARINE_ALPHA)
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_SPECPREP, ACCESS_MARINE_RO)
	hackable = TRUE

	vend_x_offset = 2
	vend_y_offset = 1
	vend_flags = VEND_CLUTTER_PROTECTION | VEND_LIMITED_INVENTORY | VEND_TO_HAND

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/cargo_guns/squad/populate_product_list(scale)
	listed_products = list(
		list("FOOD", -1, null, null),
		list("MRE", round(scale * 5), /obj/item/storage/box/MRE, VENDOR_ITEM_REGULAR),
		list("MRE Box", round(scale * 1), /obj/item/ammo_box/magazine/misc/mre, VENDOR_ITEM_REGULAR),

		list("TOOLS", -1, null, null),
		list("Entrenching Tool (ET)", round(scale * 2), /obj/item/tool/shovel/etool/folded, VENDOR_ITEM_REGULAR),
		list("Screwdriver", round(scale * 5), /obj/item/tool/screwdriver, VENDOR_ITEM_REGULAR),
		list("Wirecutters", round(scale * 5), /obj/item/tool/wirecutters, VENDOR_ITEM_REGULAR),
		list("Crowbar", round(scale * 5), /obj/item/tool/crowbar, VENDOR_ITEM_REGULAR),
		list("Wrench", round(scale * 5), /obj/item/tool/wrench, VENDOR_ITEM_REGULAR),
		list("Multitool", round(scale * 1), /obj/item/device/multitool, VENDOR_ITEM_REGULAR),
		list("ME3 hand welder", round(scale * 1), /obj/item/tool/weldingtool/simple, VENDOR_ITEM_REGULAR),

		list("FLARE AND LIGHT", -1, null, null),
		list("Combat Flashlight", round(scale * 5), /obj/item/device/flashlight/combat, VENDOR_ITEM_REGULAR),
		list("Box of Flashlight", round(scale * 1), /obj/item/ammo_box/magazine/misc/flashlight, VENDOR_ITEM_REGULAR),
		list("Box of Flares", round(scale * 1), /obj/item/ammo_box/magazine/misc/flares, VENDOR_ITEM_REGULAR),
		list("M94 Marking Flare Pack", round(scale * 10), /obj/item/storage/box/m94, VENDOR_ITEM_REGULAR),
		list("M89-S Signal Flare Pack", round(scale * 1), /obj/item/storage/box/m94/signal, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null),
		list("Engineer Kit", round(scale * 1), /obj/item/storage/toolkit/empty, VENDOR_ITEM_REGULAR),
		list("Map", round(scale * 5), /obj/item/map/current_map, VENDOR_ITEM_REGULAR),
		list("Extinguisher", round(scale * 5), /obj/item/tool/extinguisher, VENDOR_ITEM_REGULAR),
		list("Fire Extinguisher (Portable)", round(scale * 1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Roller Bed", round(scale * 1), /obj/item/roller, VENDOR_ITEM_REGULAR),
		list("Machete Scabbard (Full)", round(scale * 5), /obj/item/storage/large_holster/machete/full, VENDOR_ITEM_REGULAR),
		list("Binoculars", round(scale * 1), /obj/item/device/binoculars, VENDOR_ITEM_REGULAR),
		list("MB-6 Folding Barricades (x3)", round(scale * 2), /obj/item/stack/folding_barricade/three, VENDOR_ITEM_REGULAR),
		list("Spare PDT/L Battle Buddy Kit", round(scale * 3), /obj/item/storage/box/pdt_kit, VENDOR_ITEM_REGULAR),
		list("W-Y brand rechargeable mini-battery", round(scale * 2.5), /obj/item/cell/crap, VENDOR_ITEM_REGULAR)
		)

//--------------SQUAD ATTACHMENTS VENDOR--------------

/obj/structure/machinery/cm_vending/sorted/attachments/squad
	name = "\improper Armat Systems Squad Attachments Vendor"
	desc = "An automated supply rack hooked up to a small storage of weapons attachments. Can be accessed by any Marine Rifleman."
	req_access = list(ACCESS_MARINE_ALPHA)
	req_one_access = list(ACCESS_MARINE_LEADER, ACCESS_MARINE_SPECPREP, ACCESS_MARINE_RO)
	hackable = TRUE

	vend_y_offset = 1

/obj/structure/machinery/cm_vending/sorted/attachments/squad/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/attachments/squad/populate_product_list(scale)
	listed_products = list(
		list("BARREL", -1, null, null),
		list("Extended Barrel", round(scale * 2.5), /obj/item/attachable/extended_barrel, VENDOR_ITEM_REGULAR),
		list("Recoil Compensator", round(scale * 2.5), /obj/item/attachable/compensator, VENDOR_ITEM_REGULAR),
		list("Suppressor", round(scale * 2.5), /obj/item/attachable/suppressor, VENDOR_ITEM_REGULAR),

		list("RAIL", -1, null, null),
		list("B8 Smart-Scope", round(scale * 1.5), /obj/item/attachable/scope/mini_iff, VENDOR_ITEM_REGULAR),
		list("Magnetic Harness", round(scale * 4), /obj/item/attachable/magnetic_harness, VENDOR_ITEM_REGULAR),
		list("S4 2x Telescopic Mini-Scope", round(scale * 2), /obj/item/attachable/scope/mini, VENDOR_ITEM_REGULAR),
		list("S5 Red-Dot Sight", round(scale * 3), /obj/item/attachable/reddot, VENDOR_ITEM_REGULAR),
		list("S6 Reflex Sight", round(scale * 3), /obj/item/attachable/reflex, VENDOR_ITEM_REGULAR),
		list("S8 4x Telescopic Scope", round(scale * 2), /obj/item/attachable/scope, VENDOR_ITEM_REGULAR),

		list("UNDERBARREL", -1, null, null),
		list("Angled Grip", round(scale * 2.5), /obj/item/attachable/angledgrip, VENDOR_ITEM_REGULAR),
		list("Bipod", round(scale * 2.5), /obj/item/attachable/bipod, VENDOR_ITEM_REGULAR),
		list("Burst Fire Assembly", round(scale * 1.5), /obj/item/attachable/burstfire_assembly, VENDOR_ITEM_REGULAR),
		list("Gyroscopic Stabilizer", round(scale * 1.5), /obj/item/attachable/gyro, VENDOR_ITEM_REGULAR),
		list("Laser Sight", round(scale * 3), /obj/item/attachable/lasersight, VENDOR_ITEM_REGULAR),
		list("Mini Flamethrower", round(scale * 1.5), /obj/item/attachable/attached_gun/flamer, VENDOR_ITEM_REGULAR),
		list("XM-VESG-1 Flamer Nozzle", round(scale * 1.5), /obj/item/attachable/attached_gun/flamer_nozzle, VENDOR_ITEM_REGULAR),
		list("U7 Underbarrel Shotgun", round(scale * 1.5), /obj/item/attachable/attached_gun/shotgun, VENDOR_ITEM_REGULAR),
		list("Underbarrel Extinguisher", round(scale * 1.5), /obj/item/attachable/attached_gun/extinguisher, VENDOR_ITEM_REGULAR),
		list("Vertical Grip", round(scale * 3), /obj/item/attachable/verticalgrip, VENDOR_ITEM_REGULAR),

		list("STOCK", -1, null, null),
		list("M37 Wooden Stock", round(scale * 1.5), /obj/item/attachable/stock/shotgun, VENDOR_ITEM_REGULAR),
		list("M39 Arm Brace", round(scale * 1.5), /obj/item/attachable/stock/smg/collapsible/brace, VENDOR_ITEM_REGULAR),
		list("M39 Stock", round(scale * 1.5), /obj/item/attachable/stock/smg, VENDOR_ITEM_REGULAR),
		list("M41A Solid Stock", round(scale * 1.5), /obj/item/attachable/stock/rifle, VENDOR_ITEM_REGULAR),
		list("M44 Magnum Sharpshooter Stock", round(scale * 1.5), /obj/item/attachable/stock/revolver, VENDOR_ITEM_REGULAR)
		)



//------------CIVILIAN CREW UNIFORM VENDOR---------------


/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep
	name = "\improper ColMarTech Surplus Uniform Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard uniforms."
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Boots", round(scale * 15), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Laceup Shoes", round(scale * 15), /obj/item/clothing/shoes/laceup, VENDOR_ITEM_REGULAR),
		list("Sports Shoes", round(scale * 15), /obj/item/clothing/shoes/black, VENDOR_ITEM_REGULAR),
		list("Magboots", round(scale * 15), /obj/item/clothing/shoes/magboots, VENDOR_ITEM_REGULAR),
		list("Colonist Uniform", round(scale * 15), /obj/item/clothing/under/colonist, VENDOR_ITEM_REGULAR),
		list("Black Uniform", round(scale * 15), /obj/item/clothing/under/color/black, VENDOR_ITEM_REGULAR),
		list("Blue Uniform", round(scale * 15), /obj/item/clothing/under/color/blue, VENDOR_ITEM_REGULAR),
		list("Green Uniform", round(scale * 15), /obj/item/clothing/under/color/green, VENDOR_ITEM_REGULAR),
		list("Orange Uniform", round(scale * 15), /obj/item/clothing/under/color/orange, VENDOR_ITEM_REGULAR),
		list("White Uniform", round(scale * 15), /obj/item/clothing/under/color/white, VENDOR_ITEM_REGULAR),
		list("Yellow Uniform", round(scale * 15), /obj/item/clothing/under/color/yellow, VENDOR_ITEM_REGULAR),
		list("Grey Uniform", round(scale * 15), /obj/item/clothing/under/color/grey, VENDOR_ITEM_REGULAR),
		list("Dark Red Uniform", round(scale * 15), /obj/item/clothing/under/darkred, VENDOR_ITEM_REGULAR),
		list("Brown Gloves", round(scale * 15), /obj/item/clothing/gloves/brown, VENDOR_ITEM_REGULAR),
		list("Black Gloves", round(scale * 15), /obj/item/clothing/gloves/black, VENDOR_ITEM_REGULAR),
		list("Combat Gloves", round(scale * 15), /obj/item/clothing/gloves/combat, VENDOR_ITEM_REGULAR),
		list("Insulated Gloves", round(scale * 15), /obj/item/clothing/gloves/fyellow, VENDOR_ITEM_REGULAR),
		list("Hardhat", round(scale * 15), /obj/item/clothing/head/hardhat, VENDOR_ITEM_REGULAR),

		list("WEBBINGS", -1, null, null),
		list("Brown Webbing Vest", round(scale * 1.25), /obj/item/clothing/accessory/storage/black_vest/brown_vest, VENDOR_ITEM_REGULAR),
		list("Black Webbing Vest", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/black_vest, VENDOR_ITEM_REGULAR),
		list("Webbing", round(scale * 2), /obj/item/clothing/accessory/storage/webbing, VENDOR_ITEM_REGULAR),
		list("Drop Pouch", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/droppouch, VENDOR_ITEM_REGULAR),
		list("Shoulder Holster", round(max(1,(scale * 0.5))), /obj/item/clothing/accessory/storage/holster, VENDOR_ITEM_REGULAR),

		list("Vests", -1, null, null),
		list("High-Vis Vest", round(scale * 15), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),

		list("BACKPACK", -1, null, null, null),
		list("Lightweight Combat Backpack", round(scale * 15), /obj/item/storage/backpack/lightpack, VENDOR_ITEM_REGULAR),
		list("Industrial Backpack", round(scale * 15), /obj/item/storage/backpack/industrial, VENDOR_ITEM_REGULAR),
		list("Welder Chestrig", round(scale * 15), /obj/item/storage/backpack/marine/engineerpack/welder_chestrig, VENDOR_ITEM_REGULAR),
		list("Medic Backpack", round(scale * 15), /obj/item/storage/backpack/medic, VENDOR_ITEM_REGULAR),
		list("Leather Satchel", round(scale * 15), /obj/item/storage/backpack/satchel, VENDOR_ITEM_REGULAR),
		list("Industrial Satchel", round(scale * 15), /obj/item/storage/backpack/satchel/eng, VENDOR_ITEM_REGULAR),

		list("RESTRICTED BACKPACKS", -1, null, null),
		list("Radio Telephone Backpack", round(max(1,(scale * 0.5))), /obj/item/storage/backpack/marine/satchel/rto, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("Ammo Load Rig", round(scale * 15), /obj/item/storage/belt/marine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Loading Rig", round(scale * 15), /obj/item/storage/belt/shotgun, VENDOR_ITEM_REGULAR),
		list("General Pistol Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m4a3, VENDOR_ITEM_REGULAR),
		list("M44 Holster Rig", round(scale * 15), /obj/item/storage/belt/gun/m44, VENDOR_ITEM_REGULAR),
		list("M82F Holster Rig", round(scale * 5), /obj/item/storage/belt/gun/flaregun, VENDOR_ITEM_REGULAR),
		list("General Utility Pouch", round(scale * 15), /obj/item/storage/backpack/general_belt, VENDOR_ITEM_REGULAR),
		list("Lifesaver Belt", round(scale * 15), /obj/item/storage/belt/medical/lifesaver/full, VENDOR_ITEM_REGULAR),
		list("Toolbelt", round(scale * 15), /obj/item/storage/belt/utility/full, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Bayonet Sheath (Full)",round(scale * 15), /obj/item/storage/pouch/bayonet, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Splints, Gauze, Ointment)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/alternate, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (Pill Packets)", round(scale * 15), /obj/item/storage/pouch/firstaid/full/pills, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", round(scale * 15), /obj/item/storage/pouch/flare/full, VENDOR_ITEM_REGULAR),
		list("Small Document Pouch", round(scale * 15), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", round(scale * 15), /obj/item/storage/pouch/shotgun, VENDOR_ITEM_REGULAR),
		list("Medium General Pouch", round(scale * 15), /obj/item/storage/pouch/general/medium, VENDOR_ITEM_REGULAR),
		list("Pistol Magazine Pouch", round(scale * 15), /obj/item/storage/pouch/magazine/pistol, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(scale * 15), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(scale * 15), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),

		list("RESTRICTED POUCHES", -1, null, null, null),
		list("Construction Pouch", round(scale * 1.25), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(scale * 1.25), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("First Responder Pouch (Empty)", round(scale * 2.5), /obj/item/storage/pouch/first_responder, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(scale * 2), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Sling Pouch", round(scale * 1.25), /obj/item/storage/pouch/sling, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(scale * 15), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),
		list("Heat Absorbent Coif", round(scale * 10), /obj/item/clothing/mask/rebreather/scarf, VENDOR_ITEM_REGULAR),
		list("Rebreather", round(scale * 10), /obj/item/clothing/mask/rebreather, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles, VENDOR_ITEM_REGULAR),
		list("M1A1 Ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/v2, VENDOR_ITEM_REGULAR),
		list("Prescription ballistic goggles", round(scale * 10), /obj/item/clothing/glasses/mgoggles/prescription, VENDOR_ITEM_REGULAR),
		list("Marine RPG glasses", round(scale * 10), /obj/item/clothing/glasses/regular, VENDOR_ITEM_REGULAR),
		list("M5 Integrated Gas Mask", round(scale * 10), /obj/item/prop/helmetgarb/helmet_gasmask, VENDOR_ITEM_REGULAR),
		list("Firearm Lubricant", round(scale * 15), /obj/item/prop/helmetgarb/gunoil, VENDOR_ITEM_REGULAR),
		list("Black Scarf", round(scale *15), /obj/item/clothing/mask/tornscarf/black, VENDOR_ITEM_REGULAR),
		list("Green Scarf", round(scale *15), /obj/item/clothing/mask/tornscarf/green, VENDOR_ITEM_REGULAR),
		)

//--------------Ship SPECIFIC VERSIONS--------------
//Those vendors aren't being used i will make them us the main vendor a parent to avoid having four different
// list with just the headset changed. - Moonshanks note, used to change the headset to the right ship.

//liberty star
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/rubicon_run
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_RUBICON_RUN, ACCESS_MARINE_DATABASE, ACCESS_MARINE_CARGO)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/alpha/populate_product_list(scale)
	listed_products += list(
		list("HEADSET", -1, null, null),
		list("Rubicon Run Radio Headset", 25, /obj/item/device/radio/headset/almayer/marine/rubicon_run, VENDOR_ITEM_REGULAR),
		)

//aegis
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/pattons_ghost
	req_access = list(ACCESS_MARINE_PREP)
	req_one_access = list(ACCESS_MARINE_PATTONS_GHOST, ACCESS_MARINE_DATABASE, ACCESS_MARINE_CARGO)

/obj/structure/machinery/cm_vending/sorted/uniform_supply/squad_prep/alpha/populate_product_list(scale)
	listed_products += list(
		list("HEADSET", -1, null, null),
		list("Aegis Radio Headset", 25, /obj/item/device/radio/headset/almayer/marine/pattons_ghost, VENDOR_ITEM_REGULAR),
		)

//------------CHEF CREW VENDOR---------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chef
	name = "\improper ColMarTech Surplus Kitchen Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Kitchen Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_CHEF)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chef/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chef/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Laceup Shoes", round(1), /obj/item/clothing/shoes/laceup, VENDOR_ITEM_REGULAR),
		list("Chef Uniform", round(1), /obj/item/clothing/under/rank/chef, VENDOR_ITEM_REGULAR),
		list("Bartender Uniform", round(1), /obj/item/clothing/under/rank/bartender, VENDOR_ITEM_REGULAR),
		list("Latex Gloves", round(10), /obj/item/clothing/gloves/latex, VENDOR_ITEM_REGULAR),
		list("Chef Hat", round(1), /obj/item/clothing/head/chefhat, VENDOR_ITEM_REGULAR),

		list("Vests", -1, null, null),
		list("Apron", round(1), /obj/item/clothing/suit/chef/classic, VENDOR_ITEM_REGULAR),
		list("Chef's Apron", round(1), /obj/item/clothing/suit/chef, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch",round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),


		list("MASK", -1, null, null, null),
		list("Sterile Mask", round(scale * 15), /obj/item/clothing/mask/surgical, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Sharp Knife", round(4), /obj/item/tool/kitchen/knife, VENDOR_ITEM_REGULAR),
		list("Rolling Pin", round(4), /obj/item/tool/kitchen/rollingpin, VENDOR_ITEM_REGULAR),
)

//------------MT CREW VENDOR-----------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/maintenance_tech
	name = "\improper ColMarTech Surplus Engineering Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Engineering Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MAINT_TECH)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/maintenance_tech/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/maintenance_tech/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Magboots", round(1), /obj/item/clothing/shoes/magboots, VENDOR_ITEM_REGULAR),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Miner's Uniform", round(1), /obj/item/clothing/under/rank/miner, VENDOR_ITEM_REGULAR),
		list("Overalls", round(1), /obj/item/clothing/under/rank/worker_overalls, VENDOR_ITEM_REGULAR),
		list("Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Yellow Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/yellow, VENDOR_ITEM_REGULAR),
		list("Blue Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/blue, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),
		list("Insulated Gloves", round(1), /obj/item/clothing/gloves/marine/insulated, VENDOR_ITEM_REGULAR),
		list("White Hardhat", round(1), /obj/item/clothing/head/hardhat/white, VENDOR_ITEM_REGULAR),
		list("Welding Helmet", round(1), /obj/item/clothing/head/welding, VENDOR_ITEM_REGULAR),

		list("Vests", -1, null, null),
		list("High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),
		list("Blue High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/blue, VENDOR_ITEM_REGULAR),
		list("Yellow High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/yellow, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(1), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(1), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(1), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Electronic Pouch (full)", round(1), /obj/item/storage/pouch/electronics/full, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", round(1), /obj/item/storage/pouch/machete/full, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(1), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Mechanical Toolbox", round(1), /obj/item/storage/toolbox/mechanical, VENDOR_ITEM_REGULAR),
		list("Electrical Toolbox", round(1), /obj/item/storage/toolbox/electrical, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", round(1), /obj/item/clothing/glasses/welding, VENDOR_ITEM_REGULAR),
)

//------------CT CREW VENDOR-----------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cargo_tech
	name = "\improper ColMarTech Surplus Cargo Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Cargo Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_MAINT_TECH)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cargo_tech/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cargo_tech/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Overalls", round(1), /obj/item/clothing/under/rank/worker_overalls, VENDOR_ITEM_REGULAR),
		list("Brown Overalls", round(1), /obj/item/clothing/under/brown, VENDOR_ITEM_REGULAR),
		list("Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Yellow Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/yellow, VENDOR_ITEM_REGULAR),
		list("Blue Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/blue, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),
		list("Janitor's Uniform", round(1), /obj/item/clothing/under/rank/janitor, VENDOR_ITEM_REGULAR),
		list("Leather Gloves", round(1), /obj/item/clothing/gloves/botanic_leather, VENDOR_ITEM_REGULAR),
		list("Cargo Beanie", round(1), /obj/item/clothing/head/beanie/tan, VENDOR_ITEM_REGULAR),

		list("Vests", -1, null, null),
		list("High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),
		list("Blue High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/blue, VENDOR_ITEM_REGULAR),
		list("Yellow High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/yellow, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(1), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(1), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(1), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(1), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Hand Labeler", round(1), /obj/item/tool/hand_labeler, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
)

//------------DOCTOR CREW VENDOR-------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/doctor
	name = "\improper ColMarTech Surplus Doctors Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of Officer's Medical Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_DOCTOR)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/doctor/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/doctor/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("White Shoes", round(1), /obj/item/clothing/shoes/white, VENDOR_ITEM_REGULAR),
		list("Laceup Shoes", round(1), /obj/item/clothing/shoes/laceup, VENDOR_ITEM_REGULAR),
		list("Nurse Scrubs", round(1), /obj/item/clothing/under/rank/medical/nurse, VENDOR_ITEM_REGULAR),
		list("Doctor's Uniform", round(1), /obj/item/clothing/under/rank/medical, VENDOR_ITEM_REGULAR),
		list("Green Scrubs", round(1), /obj/item/clothing/under/rank/medical/green, VENDOR_ITEM_REGULAR),
		list("Blue Scrubs", round(1), /obj/item/clothing/under/rank/medical/blue, VENDOR_ITEM_REGULAR),
		list("Latex Gloves", round(15), /obj/item/clothing/gloves/latex, VENDOR_ITEM_REGULAR),

		list("Labcoats", -1, null, null),
		list("Officer's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat/officer, VENDOR_ITEM_REGULAR),
		list("Nurse's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat, VENDOR_ITEM_REGULAR),
		list("Researcher's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat/researcher, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(1), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Auto-Injector Pouch (full)", round(1), /obj/item/storage/pouch/autoinjector/full, VENDOR_ITEM_REGULAR),
		list("Chemist Pouch", round(1), /obj/item/storage/pouch/chem, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (full)", round(1), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("Medical Pouch (full)", round(1), /obj/item/storage/pouch/medical/full, VENDOR_ITEM_REGULAR),
		list("Med-kit Pouch (full)", round(1), /obj/item/storage/pouch/medkit/full_advanced, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("Lifesaver Belt", round(1), /obj/item/storage/belt/medical/lifesaver/full, VENDOR_ITEM_REGULAR),
		list("Medical Belt", round(1), /obj/item/storage/belt/medical/full, VENDOR_ITEM_REGULAR),
		list("Medical Belt (with defib)", round(1), /obj/item/storage/belt/medical/full/with_defib_and_analyzer, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Advanced Medkit", round(4), /obj/item/storage/firstaid/adv, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),

		list("RANK", -1, null, null, null),
		list("Officer's Beret", round(1), /obj/item/clothing/head/beret/sec/alt, VENDOR_ITEM_REGULAR),
		list("W-Y Officer's Beret", round(1), /obj/item/clothing/head/beret/centcom/officer, VENDOR_ITEM_REGULAR),
)

//------------CMO CREW VENDOR----------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cmo
	name = "\improper ColMarTech Surplus Chief Medical Officer Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Medical Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_CHIEF_MEDICAL)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cmo/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/cmo/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("White Shoes", round(1), /obj/item/clothing/shoes/white, VENDOR_ITEM_REGULAR),
		list("Laceup Shoes", round(1), /obj/item/clothing/shoes/laceup, VENDOR_ITEM_REGULAR),
		list("Nurse Scrubs", round(1), /obj/item/clothing/under/rank/medical/nurse, VENDOR_ITEM_REGULAR),
		list("Doctor's Uniform", round(1), /obj/item/clothing/under/rank/medical, VENDOR_ITEM_REGULAR),
		list("Green Scrubs", round(1), /obj/item/clothing/under/rank/medical/green, VENDOR_ITEM_REGULAR),
		list("Blue Scrubs", round(1), /obj/item/clothing/under/rank/medical/blue, VENDOR_ITEM_REGULAR),
		list("Latex Gloves", round(15), /obj/item/clothing/gloves/latex, VENDOR_ITEM_REGULAR),
		list("Officer's Beret", round(1), /obj/item/clothing/head/beret/sec/alt, VENDOR_ITEM_REGULAR),

		list("Labcoats", -1, null, null),
		list("Officer's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat/officer, VENDOR_ITEM_REGULAR),
		list("Nurse's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat, VENDOR_ITEM_REGULAR),
		list("Researcher's Labcoat", round(1), /obj/item/clothing/suit/storage/labcoat/researcher, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(1), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Auto-Injector Pouch (full)", round(1), /obj/item/storage/pouch/autoinjector/full, VENDOR_ITEM_REGULAR),
		list("Chemist Pouch", round(1), /obj/item/storage/pouch/chem, VENDOR_ITEM_REGULAR),
		list("First-Aid Pouch (full)", round(1), /obj/item/storage/pouch/firstaid/full, VENDOR_ITEM_REGULAR),
		list("Medical Pouch (full)", round(1), /obj/item/storage/pouch/medical/full, VENDOR_ITEM_REGULAR),
		list("Med-kit Pouch (full)", round(1), /obj/item/storage/pouch/medkit/full_advanced, VENDOR_ITEM_REGULAR),

		list("BELTS", -1, null, null),
		list("Lifesaver Belt", round(1), /obj/item/storage/belt/medical/lifesaver/full, VENDOR_ITEM_REGULAR),
		list("Medical Belt", round(1), /obj/item/storage/belt/medical/full, VENDOR_ITEM_REGULAR),
		list("Medical Belt (with defib)", round(1), /obj/item/storage/belt/medical/full/with_defib_and_analyzer, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Advanced Medkit", round(4), /obj/item/storage/firstaid/adv, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),

		list("RANK", -1, null, null, null),
		list("Chief Medical Officer's Beret", round(1), /obj/item/clothing/head/cmo, VENDOR_ITEM_REGULAR),
)

//------------CE CREW VENDOR-----------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chief_engineer
	name = "\improper ColMarTech Surplus Chief Engineering Officer Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Officer's Engineering Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_CHIEF_ENGINEER)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chief_engineer/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/chief_engineer/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Magboots", round(1), /obj/item/clothing/shoes/magboots, VENDOR_ITEM_REGULAR),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Miner's Uniform", round(1), /obj/item/clothing/under/rank/miner, VENDOR_ITEM_REGULAR),
		list("Overalls", round(1), /obj/item/clothing/under/rank/worker_overalls, VENDOR_ITEM_REGULAR),
		list("Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Yellow Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/yellow, VENDOR_ITEM_REGULAR),
		list("Blue Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/blue, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),
		list("Insulated Gloves", round(1), /obj/item/clothing/gloves/marine/insulated, VENDOR_ITEM_REGULAR),
		list("White Hardhat", round(1), /obj/item/clothing/head/hardhat/white, VENDOR_ITEM_REGULAR),
		list("Welding Helmet", round(1), /obj/item/clothing/head/welding, VENDOR_ITEM_REGULAR),

		list("Vests", -1, null, null),
		list("High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),
		list("Blue High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/blue, VENDOR_ITEM_REGULAR),
		list("Yellow High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/yellow, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(1), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(1), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(1), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Electronic Pouch (full)", round(1), /obj/item/storage/pouch/electronics/full, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", round(1), /obj/item/storage/pouch/machete/full, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(1), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Mechanical Toolbox", round(1), /obj/item/storage/toolbox/mechanical, VENDOR_ITEM_REGULAR),
		list("Electrical Toolbox", round(1), /obj/item/storage/toolbox/electrical, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),
		list("Welding Goggles", round(1), /obj/item/clothing/glasses/welding, VENDOR_ITEM_REGULAR),

		list("RANK", -1, null, null, null),
		list("Chief Engineer's Beret", round(1), /obj/item/clothing/head/beret/eng, VENDOR_ITEM_REGULAR),
		list("Chief Engineer's Hazard Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/black, VENDOR_ITEM_REGULAR),
)

//------------WO CREW VENDOR-----------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/warrant_officer
	name = "\improper ColMarTech Surplus Warrant Officer Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of standard Officer's Security Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_CHIEF_ENGINEER)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/warrant_officer/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/warrant_officer/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),
		list("Combat Gloves", round(1), /obj/item/clothing/gloves/marine, VENDOR_ITEM_REGULAR),
		list("CMB Cap", round(1), /obj/item/clothing/head/CMB, VENDOR_ITEM_REGULAR),

		list("Jackets and Armor", -1, null, null),
		list("Detective Coat", round(1), /obj/item/clothing/suit/storage/det_suit, VENDOR_ITEM_REGULAR),
		list("Black Detective Coat", round(1), /obj/item/clothing/suit/storage/det_suit/black, VENDOR_ITEM_REGULAR),
		list("Internal Affairs Jacket", round(1), /obj/item/clothing/suit/storage/internalaffairs, VENDOR_ITEM_REGULAR),
		list("Bulletproof Vest", round(1), /obj/item/clothing/suit/armor/bulletproof/badge, VENDOR_ITEM_REGULAR),
		list("W-Y Balistics Vest", round(1), /obj/item/clothing/suit/armor/vest/security, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(1), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),
		list("Large Pistol Magazine Pouch", round(1), /obj/item/storage/pouch/magazine/pistol/large, VENDOR_ITEM_REGULAR),
		list("Machete Pouch (Full)", round(1), /obj/item/storage/pouch/machete/full, VENDOR_ITEM_REGULAR),

		list("MASK", -1, null, null, null),
		list("Gas Mask", round(1), /obj/item/clothing/mask/gas, VENDOR_ITEM_REGULAR),

		list("Security Equiptment", -1, null, null, null),
		list("Sec Belt", round(1), /obj/item/storage/belt/security/MP/CMB/full, VENDOR_ITEM_REGULAR),
		list("Flash", round(4), /obj/item/device/flash, VENDOR_ITEM_REGULAR),
		list("Handcuffs", round(4), /obj/item/handcuffs, VENDOR_ITEM_REGULAR),
		list("Zipcuffs", round(10), /obj/item/handcuffs/zip, VENDOR_ITEM_REGULAR),
		list("Pepperspray", round(4), /obj/item/reagent_container/spray/pepper, VENDOR_ITEM_REGULAR),

		list("RANK", -1, null, null, null),
		list("Warrant Officer's Beret", round(1), /obj/item/clothing/head/beret/eng, VENDOR_ITEM_REGULAR),
		list("CMB Spearhead Revolver", round(1), /obj/item/weapon/gun/revolver/cmb, VENDOR_ITEM_REGULAR),
		list("CMB Spearhead Revolver Speedloader", round(10), /obj/item/ammo_magazine/revolver/cmb/normalpoint, VENDOR_ITEM_REGULAR),
)

//------------QUATERMASTER CREW VENDOR-------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/quatermaster
	name = "\improper ColMarTech Surplus Cargo Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of Officer's Cargo Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_QUATERMASTER)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/quatermaster/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/quatermaster/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Overalls", round(1), /obj/item/clothing/under/rank/worker_overalls, VENDOR_ITEM_REGULAR),
		list("Brown Overalls", round(1), /obj/item/clothing/under/brown, VENDOR_ITEM_REGULAR),
		list("Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Yellow Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/yellow, VENDOR_ITEM_REGULAR),
		list("Blue Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/blue, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),
		list("Janitor's Uniform", round(1), /obj/item/clothing/under/rank/janitor, VENDOR_ITEM_REGULAR),
		list("Leather Gloves", round(1), /obj/item/clothing/gloves/botanic_leather, VENDOR_ITEM_REGULAR),
		list("Cargo Beanie", round(1), /obj/item/clothing/head/beanie/tan, VENDOR_ITEM_REGULAR),

		list("Jackets and Vests", -1, null, null),
		list("High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),
		list("Blue High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/blue, VENDOR_ITEM_REGULAR),
		list("Yellow High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/yellow, VENDOR_ITEM_REGULAR),
		list("Internal Affairs Jacket", round(1), /obj/item/clothing/suit/storage/internalaffairs, VENDOR_ITEM_REGULAR),
		list("Bulletproof Vest", round(1), /obj/item/clothing/suit/armor/bulletproof/badge, VENDOR_ITEM_REGULAR),
		list("W-Y Balistics Vest", round(1), /obj/item/clothing/suit/armor/vest/security, VENDOR_ITEM_REGULAR),
		list("Bomber Jacket", round(1), /obj/item/clothing/suit/storage/bomber, VENDOR_ITEM_REGULAR),

		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(1), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(1), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(1), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(1), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(1), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Hand Labeler", round(1), /obj/item/tool/hand_labeler, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),

				list("RANK", -1, null, null, null),
		list("Logistics Officer's Beret", round(1), /obj/item/clothing/head/beret/marine/logisticsofficer, VENDOR_ITEM_REGULAR),
		list("Quatermaster's Stamp", round(1), /obj/item/tool/stamp/ro, VENDOR_ITEM_REGULAR),
		list("CMB Spearhead Revolver", round(1), /obj/item/weapon/gun/revolver/cmb, VENDOR_ITEM_REGULAR),
		list("CMB Spearhead Revolver Speedloader", round(10), /obj/item/ammo_magazine/revolver/cmb/normalpoint, VENDOR_ITEM_REGULAR),
)


//------------CAPTAIN CREW VENDOR------------
/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/captain
	name = "\improper ColMarTech Surplus Captain Equiptment Vendor"
	desc = "An automated supply rack hooked up to a small storage of Captain's Equiptment."
	req_access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_QUATERMASTER)
	req_one_access = list()
	listed_products = list()
	hackable = TRUE

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/captain/ui_state(mob/user)
	return GLOB.not_incapacitated_and_adjacent_strict_state

/obj/structure/machinery/cm_vending/sorted/uniform_supply/civilian_prep/captain/populate_product_list(scale)
	listed_products = list(
		list("STANDARD EQUIPMENT", -1, null, null, null),
		list("Jackboots", round(1), /obj/item/clothing/shoes/jackboots, VENDOR_ITEM_REGULAR),
		list("Overalls", round(1), /obj/item/clothing/under/rank/worker_overalls, VENDOR_ITEM_REGULAR),
		list("Brown Overalls", round(1), /obj/item/clothing/under/brown, VENDOR_ITEM_REGULAR),
		list("Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility, VENDOR_ITEM_REGULAR),
		list("Red Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/red, VENDOR_ITEM_REGULAR),
		list("Yellow Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/yellow, VENDOR_ITEM_REGULAR),
		list("Blue Utility Uniform", round(1), /obj/item/clothing/under/rank/synthetic/utility/blue, VENDOR_ITEM_REGULAR),
		list("Frontier Uniform", round(1), /obj/item/clothing/under/rank/synthetic/frontier, VENDOR_ITEM_REGULAR),

		list("Jackets and Vests", -1, null, null),
		list("High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest, VENDOR_ITEM_REGULAR),
		list("Blue High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/blue, VENDOR_ITEM_REGULAR),
		list("Yellow High-Vis Vest", round(1), /obj/item/clothing/suit/storage/hazardvest/yellow, VENDOR_ITEM_REGULAR),
		list("Internal Affairs Jacket", round(1), /obj/item/clothing/suit/storage/internalaffairs, VENDOR_ITEM_REGULAR),
		list("Bulletproof Vest", round(1), /obj/item/clothing/suit/armor/bulletproof/badge, VENDOR_ITEM_REGULAR),
		list("W-Y Balistics Vest", round(1), /obj/item/clothing/suit/armor/vest/security, VENDOR_ITEM_REGULAR),
		list("Bomber Jacket", round(1), /obj/item/clothing/suit/storage/bomber, VENDOR_ITEM_REGULAR),
		list("Black Bomber Jacket", round(1), /obj/item/clothing/suit/storage/bomber/alt, VENDOR_ITEM_REGULAR),
		list("Directors Jacket", round(1), /obj/item/clothing/suit/storage/director, VENDOR_ITEM_REGULAR),
		list("Bridge Coat", round(1), /obj/item/clothing/suit/storage/jacket/marine/dress/bridge_coat_grey, VENDOR_ITEM_REGULAR),
		list("Falcon Jacket", round(1), /obj/item/clothing/suit/storage/jacket/marine/dress/officer/falcon, VENDOR_ITEM_REGULAR),


		list("POUCHES", -1, null, null, null),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Construction Pouch", round(1), /obj/item/storage/pouch/construction, VENDOR_ITEM_REGULAR),
		list("Explosive Pouch", round(1), /obj/item/storage/pouch/explosive, VENDOR_ITEM_REGULAR),
		list("Tool Pouch (full)", round(1), /obj/item/storage/pouch/tools/full, VENDOR_ITEM_REGULAR),
		list("Document Pouch", round(1), /obj/item/storage/pouch/document/small, VENDOR_ITEM_REGULAR),
		list("Large Pouch", round(1), /obj/item/storage/pouch/general/large, VENDOR_ITEM_REGULAR),
		list("Pistol Pouch", round(1), /obj/item/storage/pouch/pistol, VENDOR_ITEM_REGULAR),

		list("MISCELLANEOUS", -1, null, null, null),
		list("Hand Labeler", round(1), /obj/item/tool/hand_labeler, VENDOR_ITEM_REGULAR),
		list("Compact Extinguisher", round(1), /obj/item/tool/extinguisher/mini, VENDOR_ITEM_REGULAR),

				list("RANK", -1, null, null, null),
		list("Captain's Beret", round(1), /obj/item/clothing/head/beret/centcom/captain, VENDOR_ITEM_REGULAR),
		list("Chief Officer's Beret", round(1), /obj/item/clothing/head/beret/marine/chiefofficer, VENDOR_ITEM_REGULAR),
		list("Captain's Medal", round(1), /obj/item/clothing/accessory/medal/gold/captain, VENDOR_ITEM_REGULAR),
		list("Auto-9 Pistol", round(1), /obj/item/weapon/gun/pistol/auto9, VENDOR_ITEM_REGULAR),
		list("Auto-9 Pistol Magazine", round(10), /obj/item/ammo_magazine/pistol/auto9, VENDOR_ITEM_REGULAR),
)
