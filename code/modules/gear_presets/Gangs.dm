/datum/equipment_preset/gangster
	name = "gangster"
	faction = FACTION_MERCENARY
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_RUSOEK, LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/civilian

/datum/equipment_preset/gangster/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/gangster/New()
	. = ..()
	access = get_access(ACCESS_LIST_COLONIAL_ALL)

//====Generic-Gangsters====//

/datum/equipment_preset/gangster/generic
	name = "Gangster(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER
	rank = JOB_GANGSTER
	skills = /datum/skills/civilian/survivor/prisoner

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

/datum/equipment_preset/gangster/generic_elite
	name = "Gangster elite(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER
	rank = JOB_GANGSTER
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/generic_elite/load_status(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/ppsh/with_drum_mag(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_IN_BACK)
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
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/generic_leader/load_status(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/baseballbat/metal(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73_impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	. = ..()

//====Clown-Gangsters====//
/datum/equipment_preset/gangster/clown
	name = "Gangster(clown)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CLOWN
	rank = JOB_GANGSTER_CLOWN
	languages = list(LANGUAGE_FRENCH, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/clown/load_status(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/clown(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/clown(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/clown_shoes(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/toy/bikehorn(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/uzi(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new/obj/item/weapon/gun/shotgun/double/sawn(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/clown_elite
	name = "Gangster elite(clown)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CLOWN
	rank = JOB_GANGSTER_CLOWN
	languages = list(LANGUAGE_FRENCH, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/clown_elite/load_status(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/clown(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/charcoal(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/clown_shoes(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/medical/blue(new_human), WEAR_HANDS)

	new_human.equip_to_slot(new /obj/item/toy/bikehorn(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/rifle/m16(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/uzi(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
	. = ..()


//------

/datum/equipment_preset/gangster/clown_leader
	name = "Gangster Leader(clown)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CLOWN_LEADER
	rank = JOB_GANGSTER_CLOWN_LEADER
	languages = list(LANGUAGE_FRENCH, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/clown_leader/load_status(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/clown(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/red(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/clown_shoes(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/clown_hat(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret(new_human), WEAR_HEAD)

	new_human.equip_to_slot(new /obj/item/toy/bikehorn(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/shotgun/pump(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73_impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
	. = ..()

//====BackBiter-Gangster====//
/datum/equipment_preset/gangster/backbiter
	name = "Gangster(Backbiter)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_BB
	rank = JOB_GANGSTER_BB
	languages = list(LANGUAGE_SPANISH, LANGUAGE_RUSOEK, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/backbiter/load_gear(mob/living/carbon/human/new_human)
	new_human.h_style = "Mohawk"
	new_human.r_hair = 0
	new_human.g_hair = 100
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/worker_overalls(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/aviator(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/bomber/alt(new_human), WEAR_JACKET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/bikechain(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/revolver/cmb(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/revolver/cmb(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/revolver/cmb(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/revolver/cmb(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/backbiter_elite
	name = "Gangster elite(Backbiter)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_BB
	rank = JOB_GANGSTER_BB
	languages = list(LANGUAGE_SPANISH, LANGUAGE_RUSOEK, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/backbiter_elite/load_status(mob/living/carbon/human/new_human)
	new_human.h_style = "Mohawk"
	new_human.r_hair = 0
	new_human.g_hair = 100
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/worker_overalls(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/aviator(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/bomber/armored(new_human), WEAR_JACKET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/bikechain(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/nailgun(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/revolver/cmb(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/revolver/cmb(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/revolver/cmb(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/backbiter_leader
	name = "Gangster Leader(Backbiter)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_BB_LEADER
	rank = JOB_GANGSTER_BB_LEADER
	languages = list(LANGUAGE_SPANISH, LANGUAGE_RUSOEK, LANGUAGE_ENGLISH)
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/backbiter_leader/load_status(mob/living/carbon/human/new_human)
	new_human.h_style = "Mohawk"
	new_human.r_hair = 0
	new_human.g_hair = 100
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/aviator(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber(new_human), WEAR_JACKET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/bikechain(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/heavy/co/gold(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/heavy/super/highimpact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/heavy(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/heavy(new_human), WEAR_IN_BACK)
	. = ..()

//====Yakuza-Gangster====//

/datum/equipment_preset/gangster/yakuza
	name = "Gangster(Yakuza)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_YK
	rank = JOB_GANGSTER_YK
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH, LANGUAGE_CELTIC)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/yakuza/load_gear(mob/living/carbon/human/new_human)
	new_human.r_hair = 0
	new_human.g_hair = 0
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/charcoal(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/voice/space_ninja(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/storage/large_holster/katana/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/mod88/flashlight(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/attachable/stock/mod88(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/mod88/normalpoint/extended(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/mod88/normalpoint/extended(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/mod88/normalpoint/extended(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/yakuza_elite
	name = "Gangster elite(Yakuza)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_YK
	rank = JOB_GANGSTER_YK
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH, LANGUAGE_CELTIC)
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/yakuza_elite/load_gear(mob/living/carbon/human/new_human)
	new_human.r_hair = 0
	new_human.g_hair = 0
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/really_black(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/voice/space_ninja(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/storage/large_holster/katana/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot(new /obj/item/weapon/gun/rifle/rmc_f90/civi(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/mod88/flashlight(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/mod88/normalpoint/extended(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/yakuza_leader
	name = "Gangster Leader(Yakuza)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_YK_LEADER
	rank = JOB_GANGSTER_YK_LEADER
	languages = list(LANGUAGE_JAPANESE, LANGUAGE_ENGLISH, LANGUAGE_CELTIC)
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/yakuza_leader/load_gear(mob/living/carbon/human/new_human)
	new_human.r_hair = 0
	new_human.g_hair = 0
	new_human.b_hair = 0
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/navy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/fedora(new_human), WEAR_HEAD)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/pole/fancy_cane/this_is_a_knife/katana_sharp(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/auto9(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/auto9(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/auto9(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/auto9(new_human), WEAR_IN_BACK)
	. = ..()
//====Dionysus-Gangster====//

/datum/equipment_preset/gangster/dionysus_male
	name = "Gangster(Dionysus-Male)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD
	rank =JOB_GANGSTER_CD
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/dionysus_male/load_gear(mob/living/carbon/human/new_human)
	new_human.gender = MALE
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/stripper/mankini(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/collectable/tophat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/weed(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/red(new_human), WEAR_ACCESSORY)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/broken_bottle(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/storage/pill_bottle/ultrazine/skillless(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/food/drinks/cans/beer(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	. = ..()
//------

/datum/equipment_preset/gangster/dionysus_female
	name = "Gangster(Dionysus-Female)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD
	rank =JOB_GANGSTER_CD
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/dionysus_female/load_gear(mob/living/carbon/human/new_human)
	new_human.gender = FEMALE
	new_human.f_style = "Shaved"
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/swimsuit/purple(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/nursehat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/weed(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/broken_bottle(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/storage/pill_bottle/ultrazine/skillless(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/food/drinks/cans/beer(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/dionysus_male_elite
	name = "Gangster elite(Dionysus-Male)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD
	rank = JOB_GANGSTER_CD
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/dionysus_male_elite/load_status(mob/living/carbon/human/new_human)
	new_human.gender = MALE
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/bartender(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/bowlerhat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/weed(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/mp5(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/storage/pill_bottle/ultrazine/skillless(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/food/drinks/cans/beer(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	. = ..()

/datum/equipment_preset/gangster/dionysus_female_elite
	name = "Gangster elite(Dionysus-Female)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD
	rank = JOB_GANGSTER_CD
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/dionysus_female_elite/load_status(mob/living/carbon/human/new_human)
	new_human.gender = FEMALE
	new_human.f_style = "Shaved"
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/blackskirt(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/bowlerhat(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/weed(new_human), WEAR_FACE)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/smg/mp5(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/storage/pill_bottle/ultrazine/skillless(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/food/drinks/cans/beer(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/dionysus_male_leader
	name = "Gangster Leader(Dionysus-Male)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD_LEADER
	rank = JOB_GANGSTER_CD_LEADER
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/dionysus_male_leader/load_status(mob/living/carbon/human/new_human)
	new_human.gender = MALE
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/burgundy(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/cigar/havana(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/fedora(new_human), WEAR_HEAD)

	new_human.equip_to_slot(new /obj/item/tool/lighter/zippo/gold(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/shotgun/double/cane(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73_impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	. = ..()

//------

/datum/equipment_preset/gangster/dionysus_female_leader
	name = "Gangster Leader(Dionysus-Female)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_GANGSTER_CD_LEADER
	rank = JOB_GANGSTER_CD_LEADER
	skills = /datum/skills/civilian/survivor/gangleader

/datum/equipment_preset/gangster/dionysus_female_leader/load_status(mob/living/carbon/human/new_human)
	new_human.gender = FEMALE
	new_human.f_style = "Shaved"
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/wedding/bride_white(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/waistcoat(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/cigar/havana(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/fedora(new_human), WEAR_HEAD)

	new_human.equip_to_slot(new /obj/item/tool/lighter/zippo/gold(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/shotgun/double/cane(new_human), WEAR_R_HAND)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/t73/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73_impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/syringe/drugs(new_human), WEAR_IN_BACK)
	. = ..()

//====Syndicate-Gangster====//
/datum/equipment_preset/gangster/Syndicate
	name = "Syndicate Operative"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_SYNDICATE_OP
	rank = JOB_SYNDICATE_OP
	skills = /datum/skills/civilian/survivor/prisoner

/datum/equipment_preset/gangster/Syndicate/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/fluff/turtleneck(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/headband/red(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/storage/pouch/explosive/C4(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)
	new_human.equip_to_slot(new /obj/item/weapon/gun/pistol/np92/suppressed(new_human), WEAR_L_HAND)
	new_human.equip_to_slot(new /obj/item/card/id/syndicate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/weapon/chloroform(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/np92/suppressed(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot(new /obj/item/ammo_magazine/pistol/np92/suppressed(new_human), WEAR_IN_BACK)
	. = ..()

//------
