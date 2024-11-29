/datum/equipment_preset/MLP
	name = "MLP"
	faction = FACTION_CLF
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/centcom

/datum/equipment_preset/MLP/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/MLP/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)


/datum/equipment_preset/UA
	name = "UA"
	faction = FACTION_MARINE
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/general

/datum/equipment_preset/UA/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/UA/New()
	. = ..()
	access = get_access(ACCESS_LIST_UA)

/datum/equipment_preset/VR
	name = "UA"
	faction = FACTION_COLONIST
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/centcom

/datum/equipment_preset/VR/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/VR/New()
	. = ..()
	access = get_access(ACCESS_LIST_COLONIAL_ALL)

//----MLP----//
/datum/equipment_preset/MLP/candidate
	name = "Candidate(Miners Liberation Party)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_MLP_CAN
	rank = "CAN"

/datum/equipment_preset/MLP/candidate/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/serviceoveralls(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/CLF(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/hardhat/dblue(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/withwallet(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/t73(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone(new_human), WEAR_IN_BACK)
	. = ..()

//----UA----//
/datum/equipment_preset/UA/candidate
	name = "Candidate(United Americas)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_UA_CAN
	rank = "CAN"

/datum/equipment_preset/UA/candidate/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/charcoal(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/aviator(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/cigarette/cigar(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/withwallet(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/lighter/zippo/gold(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/highpower(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone(new_human), WEAR_IN_BACK)
	. = ..()

//----Voodoo----//
/datum/equipment_preset/VR/candidate
	name = "Candidate(Voodoo Rationale`)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_VR_CAN
	rank = "CAN"

/datum/equipment_preset/VR/candidate/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/color/white(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/bio_suit/plaguedoctorsuit(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/dress(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/that(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/flashlight(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel/withwallet(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/megaphone(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/facepaint/skull(new_human), WEAR_L_HAND)
	. = ..()
