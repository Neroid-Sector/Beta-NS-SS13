/datum/equipment_preset/colonist/civilian
	name = "civi"
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/civilian

/datum/equipment_preset/colonist/civilian/load_status(mob/living/carbon/human/new_human)
	new_human.nutrition = NUTRITION_NORMAL

/datum/equipment_preset/colonist/civilian/proc/spawn_random_civi_clothes(mob/living/carbon/human/new_human)
	var/i = rand(1,17)
	switch(i)
		if (1 , 6)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist(new_human), WEAR_BODY)
		if (7)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear(new_human), WEAR_BODY)
		if (8)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/khaki(new_human), WEAR_BODY)
		if (9)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/pink(new_human), WEAR_BODY)
		if (10)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/blue(new_human), WEAR_BODY)
		if (11)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/colonist/workwear/green(new_human), WEAR_BODY)
		if (12)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/liaison_suit/charcoal(new_human), WEAR_BODY)
		if (13)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/utility(new_human), WEAR_BODY)
		if (14)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/yellow(new_human), WEAR_BODY)
		if (15)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/blue(new_human), WEAR_BODY)
		if (16)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/gray(new_human), WEAR_BODY)
		if (17)
			new_human.equip_to_slot_or_del(new/obj/item/clothing/under/rank/utility/brown(new_human), WEAR_BODY)

/datum/equipment_preset/colonist/som/proc/spawn_som_rifle(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1 , 5)
			spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)
		if (5 , 6)
			spawn_weapon(/obj/item/weapon/gun/rifle/mar40, /obj/item/ammo_magazine/rifle/mar40/ap, new_human)
		if (7 , 8)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047/som, /obj/item/ammo_magazine/rifle/ak4047, new_human)
		if (9 , 10)
			spawn_weapon(/obj/item/weapon/gun/rifle/kramer, /obj/item/ammo_magazine/rifle/kramer, new_human)

/datum/equipment_preset/colonist/som/proc/spawn_som_hat(mob/living/carbon/human/new_human)
	var/i = rand(1,10)
	switch(i)
		if (1 , 5)
			spawn_weapon(/obj/item/weapon/gun/rifle/l42a/abr40, /obj/item/ammo_magazine/rifle/l42a/abr40, new_human)
		if (5 , 6)
			spawn_weapon(/obj/item/weapon/gun/rifle/mar40, /obj/item/ammo_magazine/rifle/mar40/ap, new_human)
		if (7 , 8)
			spawn_weapon(/obj/item/weapon/gun/rifle/ak4047/som, /obj/item/ammo_magazine/rifle/ak4047, new_human)
		if (9 , 10)
			spawn_weapon(/obj/item/weapon/gun/rifle/kramer, /obj/item/ammo_magazine/rifle/kramer, new_human)

//====Generic-Civies====//

/datum/equipment_preset/colonist/civilian/generic
	name = "Civilian(generic)"
	flags = EQUIPMENT_PRESET_EXTRA
	skills = /datum/skills/civilian/survivor

/datum/equipment_preset/colonist/civilian/generic/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	spawn_random_civi_clothes(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine(new_human), WEAR_FEET)

	new_human.equip_to_slot(new /obj/item/attachable/bayonet(new_human), WEAR_L_STORE)
	new_human.equip_to_slot(new /obj/item/device/flashlight(new_human), WEAR_R_STORE)

//------

//--------SOM--------\\

//----------Soldier
/datum/equipment_preset/colonist/som
	name = "Sons of Marina Militia(SOM)"
	assignment = JOB_SOM_MILITIA
	rank = JOB_SOM_MILITIA
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/full(new_human), WEAR_WAIST)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_WAIST)
//robe
	if(prob(25))
		new_human.equip_to_slot_or_del(new 	/obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/collie(new_human), WEAR_JACKET)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/ghillie(new_human), WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
//hat
	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood(new_human), WEAR_HEAD)
	if(prob(25))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/headscarf(new_human), WEAR_HEAD)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/ua_riot(new_human), WEAR_HEAD)

	spawn_som_rifle(new_human)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	if(prob(15))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	if(prob(35))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	else
		new_human.equip_to_slot_or_del(new /obj/item/prop/helmetgarb/helmet_gasmask(new_human), WEAR_R_EAR) //fuck you I know this is shitcode
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

//----------Zealot

/datum/equipment_preset/colonist/som_z
	name = "Sons of Marina Zealot(SOM)"
	assignment = JOB_SOM_ZEALOT
	rank = JOB_SOM_ZEALOT
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_z/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/som(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/welding(new_human), WEAR_EYES)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/marine/bombvest(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/emergency(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/twohanded/fireaxe(new_human), WEAR_R_HAND)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

//----------Zealot-gunner

/datum/equipment_preset/colonist/som_z_g
	name = "Sons of Marina Zealot Gunner(SOM)"
	assignment = JOB_SOM_ZEALOT
	rank = JOB_SOM_ZEALOT
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_z_g/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/device/m2c_gun(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m2c(new_human), WEAR_WAIST)

//robe
	if(prob(25))
		new_human.equip_to_slot_or_del(new 	/obj/item/clothing/suit/storage/webbing(new_human), WEAR_JACKET)
	if(prob(45))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/collie(new_human), WEAR_JACKET)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/ghillie(new_human), WEAR_JACKET)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)


//----------Paladin

/datum/equipment_preset/colonist/som_p
	name = "Sons of Marina Paladin(SOM)"
	assignment = JOB_SOM_PALLY
	rank = JOB_SOM_PALLY
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_p/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Hero")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/mask/gas(new_human), WEAR_FACE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/grenade/som(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_R_HAND)

	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/paladin(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)

	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/ultrazine/liaison(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/emergency(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/inaprovaline(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)

	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/gas/nerve_gas(new_human), WEAR_IN_BELT)
	new_human.equip_to_slot_or_del(new/obj/item/storage/pouch/machete/full(new_human), WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/machete/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/shield/riot(new_human), WEAR_L_HAND)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)

//----------Acolyte

/datum/equipment_preset/colonist/som_a
	name = "Sons of Marina Acolyte(SOM)"
	assignment = JOB_SOM_ACOLYTE
	rank = JOB_SOM_ACOLYTE
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_a/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Horror")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs/earplugs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som/acolyte(new_human), WEAR_JACKET)

	new_human.equip_to_slot_or_del(new /obj/item/storage/large_holster/machete/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/device/implanter/rejuv(new_human), WEAR_IN_BACK)
	spawn_rebel_shoes(new_human)
	spawn_rebel_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/survival/full(new_human), WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/ert(new_human), WEAR_R_STORE)

	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainofcommand(new_human), WEAR_R_HAND)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainofcommand(new_human), WEAR_L_HAND)

	. = ..()

//----------Shaman

/datum/equipment_preset/colonist/som_s
	name = "Sons of Marina Shaman(SOM)"
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_s/load_gear(mob/living/carbon/human/new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/chainofcommand(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
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

//----------Ascended

/datum/equipment_preset/colonist/som_ascended
	name = "Sons of Marina Ascended(SOM)"
	assignment = JOB_SOM_PRIEST
	rank = JOB_SOM_PRIEST
	skills = /datum/skills/civilian/survivor/militia

/datum/equipment_preset/colonist/som_ascended/load_gear(mob/living/carbon/human/new_human)
	new_human.set_species("Horror")
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(new_human), WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset(new_human), WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/ears/earmuffs(new_human), WEAR_R_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/rank/frontier(new_human), WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/cultist_hoodie/som(new_human), WEAR_JACKET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/cultist_hood/som(new_human), WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/webley/full(new_human), WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/reagent_container/hypospray/autoinjector/chloralhydrate(new_human), WEAR_IN_BACK)
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
