/datum/equipment_preset/Gangster
	name = "Gangster"
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_COLONIST

	access = list(ACCESS_CIVILIAN_PUBLIC)
	skills = /datum/skills/civilian
	idtype = /obj/item/card/id/lanyard

	minimap_icon = "surv"
	minimap_background = MINIMAP_ICON_BACKGROUND_CIVILIAN

/datum/equipment_preset/Gangster/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/Gangster/New()
	. = ..()
	access = get_access(ACCESS_CIVILIAN_PUBLIC)

//====Generic-Gangster====//

/datum/equipment_preset/Gangster/generic
	name = "Gangster"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/Gangster/generic/New()
	. = ..()
	access = get_access(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/Gangster/generic/load_status(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_L_HAND)

//------

/datum/equipment_preset/Gangster/generic/leader
	name = "Gangster Leader"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_LEADER
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/Gangster/generic/leader/New()
	. = ..()
	access = get_access(ACCESS_CIVILIAN_PUBLIC)

/datum/equipment_preset/Gangster/generic/leader/load_status(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/ppsh/with_drum_mag(new_human), WEAR_L_HAND)

//====Clown-Gangster====//


//====BackBiter-Gangster====//


//====Yakuza-Gangster====//


//====Dyonisis-Gangster====//


//====Syndicate-Gangster====//
