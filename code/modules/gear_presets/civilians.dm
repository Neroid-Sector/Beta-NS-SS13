/datum/equipment_preset/civilian
	name = "civi"
	faction = FACTION_COLONIST
	faction_group = FACTION_LIST_HUMANOID
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE, LANGUAGE_CELTIC)
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/civilian

/datum/equipment_preset/civilian/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/civilian/New()
	. = ..()
	access = get_access(ACCESS_LIST_COLONIAL_ALL)

//====Generic-Gangsters====//

/datum/equipment_preset/civilian/generic
	name = "Civilian(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_COLONIST
	rank = JOB_COLONIST
	skills = /datum/skills/civilian/survivor

/datum/equipment_preset/civilian/generic/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)

//------



//--------SOM--------\\

/datum/equipment_preset/civilian/som
	name = "Sons of Marina Militia(SOM)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_SOM_MILITIA
	rank = JOB_SOM_MILITIA
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/civilian/som/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)

//robe
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/collie(new_human), WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)

//hat
	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)

	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

//mask

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	if(prob(30))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/tornscarf/urban(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_FACE)
	. = ..()

/datum/equipment_preset/civilian/som_s
	name = "Sons of Marina Shaman(SOM)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/civilian/som_s/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainofcommand(new_human), WEAR_WAIST)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	if(prob(30))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/tornscarf/urban(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_FACE)
	. = ..()

/datum/equipment_preset/civilian/som_ascended
	name = "Sons of Marina ascended(SOM)"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/civilian/som_ascended/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Horror")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/ua_civvies(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainofcommand(new_human), WEAR_WAIST)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)
	spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)

	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/red(new_human), WEAR_FACE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/rebreather/scarf/tacticalmask/black(new_human), WEAR_FACE)
	. = ..()
