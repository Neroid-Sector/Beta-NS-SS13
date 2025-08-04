/datum/equipment_preset/uscm/forecon
	assignment = JOB_SQUAD_MARINE
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_ME5 = JOB_PLAYTIME_TIER_0)
	idtype = /obj/item/card/id/dogtag
	role_comm_title = "FORECON"
	rank = JOB_MARINE
	faction_group = list(FACTION_MARINE)
	flags = EQUIPMENT_PRESET_START_OF_ROUND
	auto_squad_name = SQUAD_FORECON
	ert_squad = TRUE

/datum/equipment_preset/uscm/forecon/New()
	. = ..()
	access = get_access(ACCESS_LIST_UA)

	utility_under = list(/obj/item/clothing/under/marine)
	utility_hat = list(/obj/item/clothing/head/cmcap)
	utility_gloves = list(/obj/item/clothing/gloves/marine)
	utility_shoes = list(/obj/item/clothing/shoes/marine)
	utility_extra = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/cm/tan)

	service_under = list(/obj/item/clothing/under/marine/officer/bridge)
	service_over = list(/obj/item/clothing/suit/storage/jacket/marine/service, /obj/item/clothing/suit/storage/jacket/marine/service/mp)
	service_hat = list(/obj/item/clothing/head/cmcap)
	service_shoes = list(/obj/item/clothing/shoes/dress)

	dress_under = list(/obj/item/clothing/under/marine/dress/blues/senior)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/blues/nco)
	dress_hat = list(/obj/item/clothing/head/marine/dress_cover)
	dress_gloves = list(/obj/item/clothing/gloves/marine/dress)
	dress_shoes = list(/obj/item/clothing/shoes/dress)

/datum/equipment_preset/uscm/forecon/proc/add_forecon_weapon(mob/living/carbon/human/new_human)
	var/random_gun = rand(1,4)
	switch(random_gun)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41a/tactical(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/toxin(new_human), WEAR_IN_R_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/forecon(new_human), WEAR_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/toxin(new_human), WEAR_IN_R_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra/tactical(new_human), WEAR_IN_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/ap(new_human), WEAR_IN_R_STORE)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39/recon(new_human), WEAR_IN_J_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/toxin(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/uscm/forecon/proc/spawn_random_headgear(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm/tan(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beanie(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (5 , 6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/durag(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (7 , 8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/boonie(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
		if (9 , 10)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)

/datum/equipment_preset/uscm/forecon/proc/spawn_random_tech_headgear(mob/living/carbon/human/new_human)
	var/i = rand(1,4)
	switch(i)
		if (1 , 2)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/tech(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
		if (3 , 4)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/medic/white(new_human), WEAR_HEAD)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)

/datum/equipment_preset/uscm/forecon/proc/add_forecon_weapon_pistol(mob/living/carbon/human/new_human)
	var/random_pistol = rand(1,7)
	switch(random_pistol)
		if(1 , 2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m4a3(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/m1911(new_human), WEAR_IN_BELT)
		if(3 , 4)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m39/forecon, WEAR_WAIST)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv(new_human),WEAR_WAIST)
		if(6 , 7)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m10/full/extended, WEAR_WAIST)

/datum/equipment_preset/uscm/forecon/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/uscm/forecon/tech
	name = "FORECON Support Technician"
	assignment = JOB_FORECON_SUPPORT
	rank = JOB_SQUAD_TECH
	role_comm_title = "SuppTech"
	minimap_icon = "engi"
	skills = /datum/skills/ms/engi

/datum/equipment_preset/uscm/forecon/tech/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/clothing/under/marine/reconnaissance/uniform = new()
	var/obj/item/clothing/accessory/storage/droppouch/pouch = new()
	var/obj/item/clothing/accessory/ranks/marine/e5/pin = new()
	var/obj/item/clothing/accessory/patch/patch_uscm = new()
	var/obj/item/clothing/accessory/patch/forecon/patch_forecon = new()
	uniform.attach_accessory(new_human,pouch)
	uniform.attach_accessory(new_human,patch_uscm)
	uniform.attach_accessory(new_human,pin)
	uniform.attach_accessory(new_human,patch_forecon)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/insulated(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/big(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full/forecon(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/surgical(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/compact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/surgery/synthgraft, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/tool/weldingtool , WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/recon(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/facepaint/sniper(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)

	add_forecon_weapon(new_human)
	spawn_random_tech_headgear(new_human)

/datum/equipment_preset/uscm/forecon/marksman
	name = "FORECON Designated Marksman"
	assignment = JOB_FORECON_MARKSMAN
	rank = JOB_SQUAD_SPECIALIST
	role_comm_title = "DMR"
	minimap_icon = "spec"
	skills = /datum/skills/ms/rifleman

/datum/equipment_preset/uscm/forecon/marksman/load_gear(mob/living/carbon/human/new_human)
	var/obj/item/clothing/under/marine/reconnaissance/uniform = new()
	var/obj/item/clothing/accessory/storage/droppouch/pouch = new()
	var/obj/item/clothing/accessory/ranks/marine/e5/pin = new()
	var/obj/item/clothing/accessory/patch/patch_uscm = new()
	var/obj/item/clothing/accessory/patch/forecon/patch_forecon = new()
	uniform.attach_accessory(new_human,pouch)
	uniform.attach_accessory(new_human,patch_uscm)
	uniform.attach_accessory(new_human,pin)
	uniform.attach_accessory(new_human,patch_forecon)
	new_human.equip_to_slot_or_del(uniform, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/M3S, WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/plastic(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/crowbar/tactical(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/scout_cloak(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/food/drinks/flask/marine(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/facepaint/sniper(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m4ra_custom/tactical(new_human), WEAR_L_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/impact(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m4ra/custom/incendiary(new_human), WEAR_IN_BACK)
	GLOB.character_traits[/datum/character_trait/skills/spotter].apply_trait(new_human)
	..()
	add_forecon_weapon_pistol(new_human)
	spawn_random_headgear(new_human)

//--Company Commander---//

/datum/equipment_preset/uscm/forecon/ccommander
	name = "FORECON-Platoon Commander"

	assignment = JOB_FORECON_CO
	rank = JOB_FORECON_CO
	paygrades = list(PAY_SHORT_MO3)
	role_comm_title = "CDR"
	skills = /datum/skills/ms/commander
	idtype = /obj/item/card/id/gold

	minimap_icon = "xo"
	minimap_background = "background_command"

	utility_under = list(/obj/item/clothing/under/marine, /obj/item/clothing/under/marine/officer/command, /obj/item/clothing/under/marine/officer/boiler)
	utility_hat = list(/obj/item/clothing/head/cmcap,/obj/item/clothing/head/beret/cm/tan)
	utility_extra = list(/obj/item/clothing/glasses/sunglasses,/obj/item/clothing/glasses/sunglasses/big,/obj/item/clothing/glasses/sunglasses/aviator,/obj/item/clothing/glasses/mbcg)

	service_under = list(/obj/item/clothing/under/marine/officer/bridge)
	service_over = list(/obj/item/clothing/suit/storage/jacket/marine/service, /obj/item/clothing/suit/storage/jacket/marine/service/mp)
	service_shoes = list(/obj/item/clothing/shoes/dress/commander)
	service_extra = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber)
	service_hat = list(/obj/item/clothing/head/beret/cm, /obj/item/clothing/head/beret/marine/commander/dress, /obj/item/clothing/head/beret/marine/commander/black, /obj/item/clothing/head/marine/peaked/service)

	dress_under = list(/obj/item/clothing/under/marine/dress, /obj/item/clothing/under/marine/officer/formal/servicedress)
	dress_extra = list(/obj/item/storage/large_holster/ceremonial_sword/full)
	dress_hat = list(/obj/item/clothing/head/marine/peaked/captain/white, /obj/item/clothing/head/marine/peaked/captain/black, /obj/item/clothing/head/marine/peaked)
	dress_shoes = list(/obj/item/clothing/shoes/dress/commander)
	dress_over = list(/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white, /obj/item/clothing/suit/storage/jacket/marine/dress/officer/black, , /obj/item/clothing/suit/storage/jacket/marine/dress)

/datum/equipment_preset/uscm/forecon/ccommander/load_gear(mob/living/carbon/human/new_human)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/beret/cm(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/boiler(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/mateba/cmateba/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/general/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/pistol/command(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)

//------------------Squad------------------//

//---SL---//
/datum/equipment_preset/uscm/forecon/leader
	name = "FORECON-Squad Leader"

	assignment = JOB_FORECON_SL
	rank = JOB_SQUAD_LEADER
	paygrades = list(PAY_SHORT_ME5)
	role_comm_title = "SL"
	minimum_age = 27
	skills = /datum/skills/ms/sl

	minimap_icon = "leader"

/datum/equipment_preset/uscm/forecon/leader/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm/forecon/leader/full
	name = "FORECON-Squad Leader(Equipped)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/leader/full/load_gear(mob/living/carbon/human/new_human)
//clothes
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/medium/leader(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/autoinjector/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
//item
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/leader(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/device/trench_whistle,(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range/designator(new_human), WEAR_IN_ACCESSORY)
//weapon
	add_forecon_weapon(new_human)

/datum/equipment_preset/uscm/forecon/leader/full/e4
	paygrades = list(PAY_SHORT_ME4)

/datum/equipment_preset/uscm/forecon/leader/full/e6
	paygrades = list(PAY_SHORT_ME6)

/datum/equipment_preset/uscm/forecon/leader/full/e7
	paygrades = list(PAY_SHORT_ME7)

/datum/equipment_preset/uscm/forecon/leader/full/e8
	paygrades = list(PAY_SHORT_ME8)

//---SG---//
/datum/equipment_preset/uscm/forecon/sg
	name = "FORECON-Squad Smartgunner"

	assignment = JOB_FORECON_SMARTGUNNER
	rank = JOB_SQUAD_SMARTGUN
	paygrades = list(PAY_SHORT_ME3)
	role_comm_title = "SG"
	skills = /datum/skills/ms/rifleman

	minimap_icon = "smartgunner"

/datum/equipment_preset/uscm/forecon/sg/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm/forecon/sg/full
	name = "FORECON-Squad Smartgunner(Equipped)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/sg/full/load_gear(mob/living/carbon/human/new_human)
//clothes
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/flak(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cmcap/bridge(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/smartgunner(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/smartgun_battery(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_JACKET)
//weapons
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/xm99/full(new_human), WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/plasma/xm99a/scoped(new_human), WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud/plasma(new_human), WEAR_EYES)
		new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/smartgunner/full(new_human), WEAR_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_R_STORE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/xm99/full(new_human), WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/plasma/xm99a/scoped(new_human), WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud/plasma(new_human), WEAR_EYES)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/auto/underextinguisher(new_human), WEAR_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flamertank(new_human), WEAR_R_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/full(new_human), WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun(new_human), WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles(new_human), WEAR_EYES)
		new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/smartgunner/full(new_human), WEAR_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_R_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/full(new_human), WEAR_WAIST)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun(new_human), WEAR_J_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/m56_goggles(new_human), WEAR_EYES)
		new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/flamer/auto/underextinguisher(new_human), WEAR_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flamertank(new_human), WEAR_R_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/flamer_tank(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/uscm/forecon/sg/full/e2
	paygrades = list(PAY_SHORT_ME2)

/datum/equipment_preset/uscm/forecon/sg/full/e3
	paygrades = list(PAY_SHORT_ME3)

/datum/equipment_preset/uscm/forecon/sg/full/e4
	paygrades = list(PAY_SHORT_ME4)

//---Medic---//
/datum/equipment_preset/uscm/forecon/medic
	name = "FORECON-Squad Hospital Corpsman"

	assignment = JOB_FORECON_MEDIC
	rank = JOB_SQUAD_MEDIC
	paygrades = list(PAY_SHORT_ME3)
	role_comm_title = "HM"
	skills = /datum/skills/ms/medic

	minimap_icon = "medic"

	utility_under = list(/obj/item/clothing/under/marine/medic)

/datum/equipment_preset/uscm/forecon/medic/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel/medic
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/medic

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm/forecon/medic/full
	name = "FORECON-Squad Hospital Corpsman(Equipped)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/medic/full/load_gear(mob/living/carbon/human/new_human)
//clothes
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/medic(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	spawn_random_headgear(new_human)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/equipped(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/recon(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/medic(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced(new_human), WEAR_L_STORE)
//armor equipment
	new_human.equip_to_slot_or_del(new /obj/item/roller/surgical(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_JACKET)
//equipment
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular/response(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/adv(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/defibrillator(new_human), WEAR_IN_BACK)
//kit
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/czsp/medical(new_human), WEAR_L_HAND)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	add_forecon_weapon(new_human)

/datum/equipment_preset/uscm/forecon/medic/full/e4
	paygrades = list(PAY_SHORT_ME4)

//---Engi---//
/datum/equipment_preset/uscm/forecon/engineer
	name = "FORECON-Squad Combat Technician"

	assignment = JOB_FORECON_SUPPORT
	rank = JOB_SQUAD_ENGI
	paygrades = list(PAY_SHORT_ME4)
	role_comm_title = "ComTech"
	skills = /datum/skills/ms/engi

	minimap_icon = "engi"

	utility_under = list(/obj/item/clothing/under/marine/engineer)

/datum/equipment_preset/uscm/forecon/engineer/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel/tech
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine/tech

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)

//---Equipped---
/datum/equipment_preset/uscm/forecon/engineer/full
	name = "FORECON-Squad Combat Technician(Equipped)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/engineer/full/load_gear(mob/living/carbon/human/new_human)
//clothes
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/engineer(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/insulated(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/hack_goggles(new_human), WEAR_EYES)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	spawn_random_headgear(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/recon(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full/ms(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/jima(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive/emp(new_human), WEAR_L_STORE)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/device/hackingdevice(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/toolkit/ms(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/uav_drone(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/uav_drone(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/binoculars/range(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new/obj/item/device/sentry_computer(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/forecon(new_human), WEAR_J_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m41aMK1/heap(new_human), WEAR_IN_JACKET)

/datum/equipment_preset/uscm/forecon/engineer/full/e3
	paygrades = list(PAY_SHORT_ME3)

//---RFM---//
/datum/equipment_preset/uscm/forecon/rfm
	name = "FORECON-Squad Rifleman"

	assignment = JOB_FORECON_RIFLEMAN
	rank = JOB_SQUAD_MARINE
	paygrades = list(PAY_SHORT_ME2)
	role_comm_title = "Rfm"
	skills = /datum/skills/ms/rifleman

	minimap_icon = "private"

/datum/equipment_preset/uscm/forecon/rfm/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)


/datum/equipment_preset/uscm/forecon/rfm/full
	name = "FORECON-Squad Rifleman(Equipped)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/rfm/full/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	spawn_random_headgear(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/recon(new_human), WEAR_JACKET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_IN_ACCESSORY)
//kit
	pick_rfm_kit(new_human)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	add_forecon_weapon(new_human)

/datum/equipment_preset/uscm/forecon/rfm/full/e1
	paygrades = list(PAY_SHORT_ME1)

/datum/equipment_preset/uscm/forecon/rfm/full/e3
	paygrades = list(PAY_SHORT_ME3)

/datum/equipment_preset/uscm/forecon/rfm/full/e4
	paygrades = list(PAY_SHORT_ME4)


/datum/equipment_preset/uscm/forecon/rfm/scuba
	name = "FORECON-Squad Rifleman(Scuba)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/rfm/scuba/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/forecon_scuba(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/scuba(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_EYES)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/scuba(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/light/vest/forecon_scuba(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/headrig(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_nvg(new_human), WEAR_IN_HELMET)
	new_human.equip_to_slot_or_del(new /obj/item/attachable/flashlight(new_human), WEAR_IN_HELMET)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/m39/forecon(new_human), WEAR_WAIST)
//items
	new_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller/bedroll(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/box/packet/high_explosive(new_human), WEAR_IN_BACK)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/heap(new_human), WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/toxin(new_human), WEAR_IN_R_STORE)

/datum/equipment_preset/uscm/forecon/rfm/odst
	name = "FORECON-Squad Rifleman(Drop trooper)"
	flags = EQUIPMENT_PRESET_MARINE

/datum/equipment_preset/uscm/forecon/rfm/odst/load_gear(mob/living/carbon/human/new_human)
//clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/forecon(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine(new_human), WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/night/medhud(new_human), WEAR_EYES)
//accessory
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/black_vest/brown_vest(new_human), WEAR_ACCESSORY)
//armor
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/odst(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas/pmc/odst(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/odst(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/hoverpack(new_human), WEAR_BACK)
//storage
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/utility/full(new_human), WEAR_WAIST)
//vest items
	new_human.equip_to_slot_or_del(new /obj/item/tool/shovel/etool/folded(new_human), WEAR_IN_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/whiskey_supply_beacon(new_human), WEAR_IN_ACCESSORY)
//kit
	pick_rfm_kit(new_human)
//weapon
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large(new_human), WEAR_R_STORE)
	add_forecon_weapon(new_human)

//------------------Support------------------//

//---Intel---//
/datum/equipment_preset/uscm/forecon/intel
	name = "FORECON-Intelligence Officer"
	flags = EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver

	assignment = JOB_FORECON_IO
	rank = JOB_FORECON_IO
	paygrades = list(PAY_SHORT_MW2)
	role_comm_title = "IO"
	skills = /datum/skills/intel

	utility_under = list(/obj/item/clothing/under/marine/officer/intel)

	minimap_icon = "io"

/datum/equipment_preset/uscm/forecon/intel/load_gear(mob/living/carbon/human/new_human)
	var/back_item = /obj/item/storage/backpack/marine/satchel
	if (new_human.client && new_human.client.prefs && (new_human.client.prefs.backbag == 1))
		back_item = /obj/item/storage/backpack/marine

	new_human.equip_to_slot_or_del(new back_item(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/intel(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife(new_human), WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch/forecon(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(new_human), WEAR_ACCESSORY)
	add_forecon_weapon_pistol(new_human)
	spawn_random_headgear(new_human)

/datum/equipment_preset/uscm/forecon/intel/wo3
	paygrades = list(PAY_SHORT_MW3)

/datum/equipment_preset/uscm/forecon/intel/wo4
	paygrades = list(PAY_SHORT_MW4)

/datum/equipment_preset/uscm/forecon/intel/wo5
	paygrades = list(PAY_SHORT_MW5)

/datum/equipment_preset/uscm/forecon/intel/o1
	paygrades = list(PAY_SHORT_MO1)

/datum/equipment_preset/synth/uscm/forecon/synth
	name = "FORECON Synthetic"
	assignment = JOB_FORECON_SYN
	faction_group = list(FACTION_MARINE, FACTION_SURVIVOR)
	idtype = /obj/item/card/id/gold

/datum/equipment_preset/synth/uscm/forecon/synth/load_gear(mob/living/carbon/human/preset_human) //Bishop from Aliens
	preset_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/officer/engi, WEAR_BODY)
	preset_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel(preset_human), WEAR_BACK)
	preset_human.equip_to_slot_or_del(new /obj/item/device/defibrillator/synthetic, WEAR_IN_BACK)
	preset_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/red/knife(preset_human), WEAR_FEET)
	preset_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/patch(preset_human), WEAR_ACCESSORY)
	preset_human.equip_to_slot_or_del(new /obj/item/device/motiontracker/adv(preset_human), WEAR_L_HAND)
	preset_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/regular(preset_human), WEAR_R_HAND)
	preset_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/full(preset_human), WEAR_R_STORE)
	preset_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/synth/full(preset_human), WEAR_L_STORE)
	preset_human.equip_to_slot_or_del(new /obj/item/clothing/head/headset(preset_human), WEAR_HEAD)
	preset_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon(preset_human), WEAR_L_EAR)


//---FORECON VENDOR---\\

/obj/structure/machinery/cm_vending/clothing/forecon
	name = "\improper ColMarTech FORECON Special Equipment Rack"
	desc = "An automated equipment vendor for FORECON special equipment."
	icon_state = "sl_gear"
	show_points = FALSE
	req_access = list()
	vendor_role = list(JOB_FORECON_CO, JOB_FORECON_IO, JOB_SQUAD_MARINE, JOB_SQUAD_LEADER, JOB_SQUAD_ENGI, JOB_SQUAD_MEDIC, JOB_SQUAD_SPECIALIST, JOB_SQUAD_SMARTGUN, JOB_SQUAD_TEAM_LEADER)

/obj/structure/machinery/cm_vending/clothing/forecon/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_forecon

//------------GEAR---------------

GLOBAL_LIST_INIT(cm_vending_clothing_forecon, list(
		list("STANDARD EQUIPMENT (TAKE ONE)", 0, null, null, null),
		list("Standard Marine Apparel", 0, list(/obj/item/clothing/under/marine, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/distress/forecon, /obj/item/clothing/ears/earmuffs/earplugs, /obj/item/clothing/suit/storage/marine/light/recon, /obj/item/clothing/head/helmet/marine), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MK50. Combat Compression Suit", 0, list(/obj/item/clothing/under/marine/forecon, /obj/item/clothing/shoes/marine/knife, /obj/item/clothing/gloves/marine, /obj/item/device/radio/headset/distress/forecon, /obj/item/clothing/ears/earmuffs/earplugs, /obj/item/clothing/glasses/night/medhud, /obj/item/clothing/mask/gas/pmc/odst, /obj/item/clothing/suit/storage/marine/odst, /obj/item/clothing/head/helmet/marine/odst), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("MK50. Combat Wetsuit", 0, list(/obj/item/clothing/under/marine/forecon_scuba, /obj/item/clothing/shoes/marine/scuba, /obj/item/clothing/gloves/marine, /obj/item/clothing/mask/gas/scuba, /obj/item/clothing/suit/storage/marine/light/vest/forecon_scuba, /obj/item/device/radio/headset/distress/forecon, /obj/item/clothing/ears/earmuffs/earplugs, /obj/item/clothing/head/helmet/marine/headrig, /obj/item/clothing/glasses/night/medhud), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),

		list("FORECON ARMOR", 0, null, null, null),
		list("M3-L Recon Armor", 5, /obj/item/clothing/suit/storage/marine/light/recon, null, VENDOR_ITEM_REGULAR),
		list("MK50. Compression Suit", 5, /obj/item/clothing/suit/storage/marine/odst, null, VENDOR_ITEM_REGULAR),
		list("MK50. Compression Helmet", 5, /obj/item/clothing/head/helmet/marine/odst, null, VENDOR_ITEM_REGULAR),

		list("RESTRICTED FIREARMS", 0, null, null, null),
		list("M39-R Submachinegun", 5, /obj/item/weapon/gun/smg/m39/recon, null, VENDOR_ITEM_REGULAR),
		list("M4a1mk1-R Rifle", 5, /obj/item/weapon/gun/rifle/m41aMK1/forecon, null, VENDOR_ITEM_REGULAR),
		list("M4a1mk2-R Rifle", 5, /obj/item/weapon/gun/rifle/m41a/tactical, null, VENDOR_ITEM_REGULAR),
		list("M4RA-R DMR", 5,/obj/item/weapon/gun/rifle/m4ra/tactical, null, VENDOR_ITEM_REGULAR),

		list("SPECIAL EQUIPMENT", 0, null, null, null),
		list("M2 night vision goggles", 5, /obj/item/prop/helmetgarb/helmet_nvg, null, VENDOR_ITEM_REGULAR),
		list("Mk7 tactical headrig", 5, /obj/item/clothing/head/helmet/marine/headrig, null, VENDOR_ITEM_REGULAR),
		list("Mk5 camera headrig", 5, /obj/item/device/radio/headset/almayer/marine/overwatch_camera/forecon, null, VENDOR_ITEM_REGULAR),
		list("Thermal Headsight", 5, /obj/item/clothing/glasses/night/medhud, null, VENDOR_ITEM_REGULAR),
		list("Jump-pack", 5, /obj/item/hoverpack, null, VENDOR_ITEM_REGULAR),

	))
