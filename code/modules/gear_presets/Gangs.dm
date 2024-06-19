/datum/equipment_preset/gangster
	name = "gangster"
	faction = FACTION_MERCENARY
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/lanyard

/datum/equipment_preset/gangster/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/gangster/New()
	. = ..()
	access = get_access(ACCESS_LIST_COLONIAL_ALL)


/datum/equipment_preset/gangster/generic
	name = "Gangster(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER
	rank = JOB_GANGSTER

/datum/equipment_preset/gangster/generic/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/generic_leader
	name = "Gangster Leader(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_LEADER
	rank = JOB_GANGSTER_LEADER

/datum/equipment_preset/gangster/generic_leader/load_status(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/ppsh/with_drum_mag(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73_impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	. = ..()

//====Clown-Gangster====//
/datum/equipment_preset/gangster/clown
	name = "Gangster(clown)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CLOWN
	rank = JOB_GANGSTER_CLOWN

/datum/equipment_preset/gangster/clown/load_status(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/clown(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/clown(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/clown_shoes(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/toy/bikehorn(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/clown_leader
	name = "Gangster Leader(clown)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CLOWN_LEADER
	rank = JOB_GANGSTER_CLOWN_LEADER

/datum/equipment_preset/gangster/clown_leader/load_status(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/clown(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/clown(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/clown_shoes(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/toy/bikehorn(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	. = ..()

//====BackBiter-Gangster====//


//====Yakuza-Gangster====//


//====Dyonisis-Gangster====//


//====Syndicate-Gangster====//
