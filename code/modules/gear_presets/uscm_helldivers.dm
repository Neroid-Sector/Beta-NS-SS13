/datum/equipment_preset/uscm_helldivers
	name = "helldivers"
	faction = FACTION_MARINE
	faction_group = FACTION_LIST_MARINE
	languages = list(LANGUAGE_ENGLISH)
	idtype = /obj/item/card/id/dogtag

/datum/equipment_preset/uscm_helldivers/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

	utility_under = list(/obj/item/clothing/under/marine/officer/command)
	utility_hat = list(/obj/item/clothing/head/cmcap)
	utility_gloves = list(/obj/item/clothing/gloves/marine)
	utility_shoes = list(/obj/item/clothing/shoes/marine/knife)
	utility_extra = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/cm/tan)

	service_under = list(/obj/item/clothing/under/marine/officer/bridge)
	service_over = list(/obj/item/clothing/suit/storage/jacket/marine/service, /obj/item/clothing/suit/storage/jacket/marine/service/mp)
	service_hat = list(/obj/item/clothing/head/cmcap)
	service_shoes = list(/obj/item/clothing/shoes/dress)

	dress_under = list(/obj/item/clothing/under/marine/dress)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress)
	dress_hat = list(/obj/item/clothing/head/marine/peaked)
	dress_gloves = list(/obj/item/clothing/gloves/marine/dress)
	dress_shoes = list(/obj/item/clothing/shoes/dress)

//*****************************************************************************************************/



//------Command------//

//---CO---//
/datum/equipment_preset/uscm_helldivers/commander
	name = "Commanding Officer (helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_RUSSIAN, LANGUAGE_GERMAN, LANGUAGE_JAPANESE)

	idtype = /obj/item/card/id/gold
	assignment = JOB_HD_CO
	rank = JOB_HD_CO
	paygrade = "MO4"
	role_comm_title = "CO"
	minimum_age = 30
	skills = /datum/skills/ms/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

	utility_under = list(/obj/item/clothing/under/marine, /obj/item/clothing/under/marine/officer/command, /obj/item/clothing/under/marine/officer/boiler)
	utility_hat = list(/obj/item/clothing/head/cmcap,/obj/item/clothing/head/beret/cm/tan)
	utility_extra = list(/obj/item/clothing/glasses/sunglasses,/obj/item/clothing/glasses/sunglasses/big,/obj/item/clothing/glasses/sunglasses/aviator,/obj/item/clothing/glasses/mbcg)

	service_under = list(/obj/item/clothing/under/marine/officer/formal/white, /obj/item/clothing/under/marine/officer/formal/black)
	service_shoes = list(/obj/item/clothing/shoes/dress/commander)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber)
	service_hat = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/marine/commander/dress, /obj/item/clothing/head/beret/marine/commander/black)

	dress_under = list(/obj/item/clothing/under/marine/dress, /obj/item/clothing/under/marine/officer/formal/servicedress)
	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)
	dress_hat = list(/obj/item/clothing/head/marine/peaked/captain/white, /obj/item/clothing/head/marine/peaked/captain/black, /obj/item/clothing/head/marine/peaked)
	dress_shoes = list(/obj/item/clothing/shoes/dress/commander)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/black, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/suit, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/falcon, /obj/item/clothing/suit/storage/jacket/marine/dress)

/datum/equipment_preset/uscm_helldivers/commander/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL)

/datum/equipment_preset/uscm_helldivers/commander/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscm_helldivers/commander/load_gear(mob/living/carbon/human/new_human)

	var/back_item = /obj/item/storage/backpack/satchel/lockable

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/command(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/droppouch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/brown(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/techofficer/commander(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/commander/dress(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/big(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/tan(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/cmateba/full(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/command(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/cotablet(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_ACCESSORY)

//MAJOR
/datum/equipment_preset/uscm_helldivers/commander/major
	name = "USCM Major (helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	rank = JOB_HD_CO
	paygrade = "MO4"
	role_comm_title = "CO"
	minimum_age = 35

	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/black, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/suit, /obj/item/clothing/suit/storage/jacket/marine/dress)


/datum/equipment_preset/uscm_helldivers/commander/major/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster(new_human), WEAR_ACCESSORY)
	. = ..()

/datum/equipment_preset/uscm_helldivers/gcommander
	name = "Company Commander (helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	assignment = JOB_HD_GC
	rank = JOB_HD_GC
	paygrade = "MO3"
	role_comm_title = "CDR"
	skills = /datum/skills/ms/commander
	idtype = /obj/item/card/id/gold

	minimap_icon = "co"

	utility_under = list(/obj/item/clothing/under/marine, /obj/item/clothing/under/marine/officer/command, /obj/item/clothing/under/marine/officer/boiler)
	utility_hat = list(/obj/item/clothing/head/cmcap,/obj/item/clothing/head/beret/cm/tan)
	utility_extra = list(/obj/item/clothing/glasses/sunglasses,/obj/item/clothing/glasses/sunglasses/big,/obj/item/clothing/glasses/sunglasses/aviator,/obj/item/clothing/glasses/mbcg)

	service_under = list(/obj/item/clothing/under/marine/officer/formal/white, /obj/item/clothing/under/marine/officer/formal/black)
	service_shoes = list(/obj/item/clothing/shoes/dress/commander)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber)
	service_hat = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/marine/commander/dress, /obj/item/clothing/head/beret/marine/commander/black, /obj/item/clothing/head/marine/peaked/service)

	dress_under = list(/obj/item/clothing/under/marine/dress, /obj/item/clothing/under/marine/officer/formal/servicedress)
	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)
	dress_hat = list(/obj/item/clothing/head/marine/peaked/captain/white, /obj/item/clothing/head/marine/peaked/captain/black, /obj/item/clothing/head/marine/peaked)
	dress_shoes = list(/obj/item/clothing/shoes/dress/commander)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/black, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/suit, /obj/item/clothing/suit/storage/jacket/marine/dress)

/datum/equipment_preset/uscm_helldivers/gcommander/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/gcommander/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/cmateba/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/command(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)



//--Ground Commander---//

/datum/equipment_preset/uscm_helldivers/gcommander
	name = "Company Commander (helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	assignment = JOB_HD_GC
	rank = JOB_HD_GC
	paygrade = "MO3"
	role_comm_title = "CDR"
	skills = /datum/skills/ms/commander
	idtype = /obj/item/card/id/gold

	minimap_icon = "co"

	utility_under = list(/obj/item/clothing/under/marine, /obj/item/clothing/under/marine/officer/command, /obj/item/clothing/under/marine/officer/boiler)
	utility_hat = list(/obj/item/clothing/head/cmcap,/obj/item/clothing/head/beret/cm/tan)
	utility_extra = list(/obj/item/clothing/glasses/sunglasses,/obj/item/clothing/glasses/sunglasses/big,/obj/item/clothing/glasses/sunglasses/aviator,/obj/item/clothing/glasses/mbcg)

	service_under = list(/obj/item/clothing/under/marine/officer/formal/white, /obj/item/clothing/under/marine/officer/formal/black)
	service_shoes = list(/obj/item/clothing/shoes/dress/commander)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber)
	service_hat = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/marine/commander/dress, /obj/item/clothing/head/beret/marine/commander/black, /obj/item/clothing/head/marine/peaked/service)

	dress_under = list(/obj/item/clothing/under/marine/dress, /obj/item/clothing/under/marine/officer/formal/servicedress)
	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)
	dress_hat = list(/obj/item/clothing/head/marine/peaked/captain/white, /obj/item/clothing/head/marine/peaked/captain/black, /obj/item/clothing/head/marine/peaked)
	dress_shoes = list(/obj/item/clothing/shoes/dress/commander)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/black, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/suit, /obj/item/clothing/suit/storage/jacket/marine/dress)

/datum/equipment_preset/uscm_helldivers/gcommander/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/gcommander/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/cmateba/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/command(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)

//---Adjunct---//
/datum/equipment_preset/uscm_helldivers/xo
	name = "Adjunct(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_HD_XO
	rank = JOB_HD_XO
	paygrade = "MO2"
	role_comm_title = "Adjc"
	minimum_age = 35
	skills = /datum/skills/ms/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_HEAD)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)

/datum/equipment_preset/uscm_helldivers/xo/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL)

/datum/equipment_preset/uscm_helldivers/xo/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/mod88(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)

//---Captain---//
/datum/equipment_preset/uscm_helldivers/cpt
	name = "USCM Captain(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_HD_CPT
	rank = JOB_HD_CPT
	paygrade = "MO3"
	role_comm_title = "CPT"
	minimum_age = 35
	skills = /datum/skills/ms/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_HEAD)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)

/datum/equipment_preset/uscm_helldivers/cpt/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/cpt/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom/cdrcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/jacket/marine/service(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)

//---LT---//
/datum/equipment_preset/uscm_helldivers/lt
	name = "USCM Lieutenant(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_HD_LT
	rank = JOB_HD_LT
	paygrade = "MO1"
	role_comm_title = "LT"
	minimum_age = 25
	skills = /datum/skills/ms/LT

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_BRONZE)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/uscm_helldivers/lt/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/lt/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/bridge(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/mod88(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_L_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)

//---Platoon Commander---//
/datum/equipment_preset/uscm_helldivers/pc
	name = "Platoon Commander(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_HD_PC
	rank = JOB_HD_PC
	paygrade = "MO1"
	role_comm_title = "LT"
	minimum_age = 25
	skills = /datum/skills/ms/LT

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_BRONZE)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/uscm_helldivers/pc/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/pc/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/mcom(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/mod88(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new/obj/item/tool/crew_monitor(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_L_HAND)

//------Squad------//

//---SL---//
/datum/equipment_preset/uscm_helldivers/leader
	name = "Squad Leader(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	access = list(ACCESS_MARINE_PREP, ACCESS_MARINE_LEADER, ACCESS_MARINE_BRIG, ACCESS_MARINE_DROPSHIP)
	assignment = JOB_HD_SL
	rank = JOB_HD_SL
	paygrade = "ME5"
	role_comm_title = "SL"
	minimum_age = 27
	skills = /datum/skills/ms/sl

	minimap_icon = "leader"

/datum/equipment_preset/uscm_helldivers/leader/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_MAIN)

/datum/equipment_preset/uscm_helldivers/leader/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm_helldivers/leader/full
	name = "Squad Leader(helldivers)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm_helldivers/leader/full/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo/lead(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/leader(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/leader(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)

//---SG---//
/datum/equipment_preset/uscm_helldivers/sg
	name = "Squad Smartgunner(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	access = list(
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_DROPSHIP,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_ALPHA,
		ACCESS_MARINE_BRAVO,
		ACCESS_MARINE_CHARLIE,
		ACCESS_MARINE_DELTA,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_SMARTPREP,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_BRIG,
	)
	assignment = JOB_HD_SMARTGUNNER
	rank = JOB_HD_SMARTGUNNER
	paygrade = "ME3"
	role_comm_title = "SG"
	skills = /datum/skills/ms/rifleman

	minimap_icon = "smartgunner"

/datum/equipment_preset/uscm_helldivers/sg/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm_helldivers/sg/full
	name = "Squad Smartgunner(helldivers)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm_helldivers/sg/full/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/smartgunner(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/smartgun_battery(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/underextinguisher(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flamertank(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)

//---Medic---//
/datum/equipment_preset/uscm_helldivers/medic
	name = "Squad Hospital Corpsman(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	access = list(
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_DROPSHIP,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_ALPHA,
		ACCESS_MARINE_BRAVO,
		ACCESS_MARINE_CHARLIE,
		ACCESS_MARINE_DELTA,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_MEDPREP,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_BRIG,
	)
	assignment = JOB_HD_MEDIC
	rank = JOB_HD_MEDIC
	paygrade = "ME3"
	role_comm_title = "HM"
	skills = /datum/skills/ms/medic

	minimap_icon = "medic"

	utility_under = list(/obj/item/clothing/under/marine/medic)

/datum/equipment_preset/uscm_helldivers/medic/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel/medic
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/medic

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm_helldivers/medic/full
	name = "Squad Hospital Corpsman(helldivers)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm_helldivers/medic/full/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel/medic
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/medic

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/medic(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo/med(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/medic(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/czsp/medical(new_human), WEAR_L_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)

//---Engi---//
/datum/equipment_preset/uscm_helldivers/engineer
	name = "Squad Combat Technician(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	access = list(
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_DROPSHIP,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_ALPHA,
		ACCESS_MARINE_BRAVO,
		ACCESS_MARINE_CHARLIE,
		ACCESS_MARINE_DELTA,
		ACCESS_MARINE_ENGPREP,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_BRIG,
	)
	assignment = JOB_HD_ENGINEER
	rank = JOB_HD_ENGINEER
	paygrade = "ME4"
	role_comm_title = "ComTech"
	skills = /datum/skills/ms/engi

	minimap_icon = "engi"

	utility_under = list(/obj/item/clothing/under/marine/engineer)

/datum/equipment_preset/uscm_helldivers/engineer/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel/tech
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/tech

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm_helldivers/engineer/full
	name = "Squad Combat Technician(helldivers)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm_helldivers/engineer/full/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack/welder_chestrig(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/engineer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/tech(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo/engi(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/insulated(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/engineerpack(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full/ms(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/construction/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/defenses/handheld/sentry(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/defenses/handheld/sentry(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/toolkit/ms(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/nailgun(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/sentry_computer(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/kit/engineering_supply_kit(new_human), WEAR_L_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)

//---RFM---//
/datum/equipment_preset/uscm_helldivers/rfm
	name = "Squad Rifleman(helldivers)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	access = list(
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_DROPSHIP,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_ALPHA,
		ACCESS_MARINE_BRAVO,
		ACCESS_MARINE_CHARLIE,
		ACCESS_MARINE_DELTA,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_BRIG,
	)
	assignment = JOB_HD_RFM
	rank = JOB_HD_RFM
	paygrade = "ME2"
	role_comm_title = "Rfm"
	skills = /datum/skills/ms/rifleman

	minimap_icon = "private"

/datum/equipment_preset/uscm_helldivers/rfm/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

/datum/equipment_preset/uscm_helldivers/rfm/full
	name = "Squad Rifleman(helldivers)"
	flags = EQUIPMENT_PRESET_EXTRA|EQUIPMENT_PRESET_MARINE


/datum/equipment_preset/uscm_helldivers/rfm/full/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/cryo(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/helldivers(new_human), WEAR_ACCESSORY)
	pick_rfm_kit(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/carrier(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiondetector, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_R_STORE)

