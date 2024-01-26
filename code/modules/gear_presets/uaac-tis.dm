/*****************************************************************************************************/
// UAAC-TIS, a collective intelligence agency creted during the UA's formation.
/*****************************************************************************************************/

/datum/equipment_preset/uscm_event/uaac/tis
	name = "UAAC-TIS"

	idtype = /obj/item/card/id/tis
	skills = /datum/skills/tis

/datum/equipment_preset/uscm_event/uaac/tis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL)

/************************************************/
/datum/equipment_preset/uscm_event/uaac/tis/es
	name = "UAAC-TIS Escort Officer (NE5)"
	minimum_age = 25
	skills = /datum/skills/tis

	assignment = JOB_TIS_ES
	rank = "UAAC-TIS Escort Officer"
	paygrade = "NE5"
	role_comm_title = "TIS-ES"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/es/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel/sec
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/satchel/sec

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/tis(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/uaac/tis/es(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/security/MP/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/uaac/tis/es(new_human), WEAR_JACKET)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/black(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/marsoc(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/mk1_heap(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/tis(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m46c/tactical(new_human), WEAR_J_STORE)

	to_chat(new_human, SPAN_WARNING("You are an Escort Officer for UAAC-TIS, an intelligence agency with tremendous power. You are tasked with protecting your superiors and them alone, follow their orders. You are outside the normal USCM chain of command."))

/datum/equipment_preset/uscm_event/uaac/tis/es/load_rank(mob/living/carbon/human/new_human)
	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_1)
			return "NE6"

	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_2)
			return "NE7"

	return paygrade

/*****************************************************************************************************/
/datum/equipment_preset/uscm_event/uaac/tis/io
	name = "UAAC-TIS Intelligence Officer (NO1)"
	minimum_age = 25
	skills = /datum/skills/tis

	assignment = JOB_TIS_IO
	rank = "UAAC-TIS Intelligence Officer"
	paygrade = "NO1"
	role_comm_title = "TIS-IO"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/io/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel/lockable
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/satchel/lockable

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/tis(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/uaac/tis/io(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/document(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/tis(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder(new_human), WEAR_IN_R_STORE)

	to_chat(new_human, SPAN_WARNING("You are an Intelligence Officer for UAAC-TIS, an intelligence agency with tremendous power. You are tasked with retrieving or transporting sensitive materials to and from a location, you may also be involved in sensative operations. You are outside the normal USCM chain of command."))


/*****************************************************************************************************/
/datum/equipment_preset/uscm_event/uaac/tis/sio
	name = "UAAC-TIS Senior Intelligence Officer (NO2)"
	minimum_age = 25
	skills = /datum/skills/tis

	assignment = JOB_TIS_SIO
	rank = "UAAC-TIS Senior Intelligence Officer"
	paygrade = "NO2"
	role_comm_title = "TIS-SIO"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/sio/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel/lockable
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/satchel/lockable

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/tis(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/uaac/tis/seniorio(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3/commander(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing/black(new_human), WEAR_JACKET)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/black(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/document(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/tis(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder(new_human), WEAR_IN_R_STORE)

	to_chat(new_human, SPAN_WARNING("You are a Senior Intelligence Officer for UAAC-TIS, an intelligence agency with tremendous power. You are tasked with retrieving or transporting sensitive materials to and from a location, you may also be involved in sensative operations. You are outside the normal USCM chain of command."))

/datum/equipment_preset/uscm_event/uaac/tis/sio/load_rank(mob/living/carbon/human/new_human)
	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_2)
			return "NO3"

	return paygrade

/*****************************************************************************************************/
/datum/equipment_preset/uscm_event/uaac/tis/sa
	name = "UAAC-TIS Special Agent (NO5)"
	minimum_age = 30
	skills = /datum/skills/tiscomm

	assignment = JOB_TIS_SA
	rank = "UAAC-TIS Special Agent"
	paygrade = "NO4"
	role_comm_title = "TIS-SA"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/sa/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel/lockable/fancy
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/satchel/lockable/fancy

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/tis(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/uaac/tis(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/council/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/uaac/tis/sa(new_human), WEAR_JACKET)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/mp/tis(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/large/mateba/impact(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/tis(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/mateba_case/captain/council(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/baton(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder(new_human), WEAR_IN_R_STORE)

	to_chat(new_human, SPAN_WARNING("You are a Special Agent for UAAC-TIS, an intelligence agency with tremendous power. You are tasked with investigating sensitive operations and resolving them carefully, you possess a large amount of authority and and may seize UAAC assets to aid in your assigned objectives. You are outside the normal USCM chain of command."))

/datum/equipment_preset/uscm_event/uaac/tis/sa/load_rank(mob/living/carbon/human/new_human)
	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_1)
			return "NO5"

	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_2)
			return "NO6"

	return paygrade

/*****************************************************************************************************/
/datum/equipment_preset/uscm_event/uaac/tis/co
	name = "UAAC-TIS Coordinator (NO6E)"
	minimum_age = 35
	skills = /datum/skills/tiscomm

	assignment = JOB_TIS_CO
	rank = "UAAC-TIS Coordinator"
	paygrade = "NO6E"
	role_comm_title = "TIS-CO"
	flags = EQUIPMENT_PRESET_EXTRA

/datum/equipment_preset/uscm_event/uaac/tis/co/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/satchel/lockable/fancy
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/satchel/lockable/fancy

	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/tis(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/uaac/tis/co(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/general/impact(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/bomber/armored(new_human), WEAR_JACKET)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses/sechud/hidden(new_human), WEAR_EYES)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/marine/mp/tis/co(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/pistol/large/mateba/impact(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/health/ceramic_plate(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/tis(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/mateba_case/general(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/baton(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/taperecorder(new_human), WEAR_IN_R_STORE)

	to_chat(new_human, SPAN_WARNING("You are a Coordinator for UAAC-TIS, an intelligence agency with tremendous power. You maintain entire intelligence networks and ensure their smooth running, you possess an extreme amount of authority and will generally outrank anyone in your AO. You are generally not supposed to get involved personally in operations but are allowed if deemed important enough. You are outside the normal USCM chain of command."))

/datum/equipment_preset/uscm_event/uaac/tis/co/load_rank(mob/living/carbon/human/new_human)
	if(new_human.client)
		if(get_job_playtime(new_human.client, rank) > JOB_PLAYTIME_TIER_2)
			return "NO6C"

	return paygrade

/*****************************************************************************************************/
