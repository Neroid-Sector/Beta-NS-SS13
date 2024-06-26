/datum/equipment_preset/roninsec
	name = "RONIN SECURITY"
	rank = FACTION_PMC
	idtype = /obj/item/card/id/pmc
	faction = FACTION_PMC
	faction_group = FACTION_LIST_WY
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	var/human_versus_human = FALSE
	var/headset_type = /obj/item/device/radio/headset/distress/pmc

//	/datum/equipment_preset/roninsec/New()
//	. = ..()
//	access = get_access(ACCESS_LIST_WY_PMC)


/datum/equipment_preset/roninsec/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(MALE,FEMALE)
	var/random_name
	var/first_name
	var/last_name
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	if(new_human.gender == MALE)
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_male_pmc)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_female_pmc)]"
	if(prob(25))
		last_name = "[capitalize(randomly_generate_japanese_word(rand(2, 4)))]"
	else
		last_name = "[pick(last_names_pmc)]"
	random_name = "[first_name] [last_name]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(25,35)
	new_human.h_style = "Shaved Head"
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/roninsec/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_PMC
	return ..()

///////////////////////RONIN SECURITY///////////////////////////

/datum/equipment_preset/roninsec/rfn
	name = JOB_RONIN_RFN
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_RFN
	rank = JOB_RONIN_RFN
	role_comm_title = "Ron. Sec. Rifleman"
	paygrade = "RS-RFN"
	skills = /datum/skills/pmc

/datum/equipment_preset/roninsec/medic
	name = JOB_RONIN_MEDIC
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_MEDIC
	rank = JOB_RONIN_MEDIC
	role_comm_title = "Ron. Sec. Trauma Surg."
	paygrade = "RS-DOC"
	skills = /datum/skills/pmc/doctor

/datum/equipment_preset/roninsec/comtech
	name = JOB_RONIN_COMTECH
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_COMTECH
	rank = JOB_RONIN_COMTECH
	role_comm_title = "Ron. Sec. Assault Tech"
	paygrade = "RS-TECH"
	skills = /datum/skills/pmc/engineer

/datum/equipment_preset/roninsec/breach
	name = JOB_RONIN_BREACHER
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_BREACHER
	rank = JOB_RONIN_BREACHER
	role_comm_title = "Ron. Sec. Breacher"
	paygrade = "RS-BREACH"
	skills = /datum/skills/pmc

/datum/equipment_preset/roninsec/heavy
	name = JOB_RONIN_HEAVY
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_HEAVY
	rank = JOB_RONIN_HEAVY
	role_comm_title = "Ron. Sec. Hv. Rifleman"
	paygrade = "RS-HV"
	skills = /datum/skills/pmc/specialist

/datum/equipment_preset/roninsec/gunner
	name = JOB_RONIN_GUNNER
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = JOB_RONIN_GUNNER
	rank = JOB_RONIN_GUNNER
	role_comm_title = "Ron. Sec. Gunner"
	paygrade = "RS-SG"
	skills = /datum/skills/pmc/smartgunner

/datum/equipment_preset/roninsec/leader
	name = JOB_RONIN_LEADER
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_RONIN_LEADER
	rank = JOB_RONIN_LEADER
	role_comm_title = "Ron. Sec. TL"
	paygrade = "RS-TL"
	skills = /datum/skills/pmc/SL
	headset_type = /obj/item/device/radio/headset/distress/pmc/command
/datum/equipment_preset/roninsec/Adjunct
	name = JOB_RONIN_ADJUNCT
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = JOB_RONIN_ADJUNCT
	rank = JOB_EXECUTIVE_SPECIALIST
	paygrade = "WYC5"
	skills = /datum/skills/pmc/SL
	headset_type = /obj/item/device/radio/headset/distress/pmc/command

///////////RONIN SECURITY SPECIAL///////////////

/datum/equipment_preset/roninsec/synth
	name = JOB_RONIN_SYNTH
	flags = EQUIPMENT_PRESET_EXTRA

	languages = ALL_SYNTH_LANGUAGES

	skills = /datum/skills/synthetic
	idtype = /obj/item/card/id/pmc
	assignment = JOB_RONIN_SYNTH
	rank = JOB_RONIN_SYNTH
	role_comm_title = "Ron. Sec. Synth"
	headset_type = /obj/item/device/radio/headset/distress/pmc/command


/datum/equipment_preset/roninsec/synth/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(50;MALE,50;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(prob(10))
		random_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
	else if(new_human.gender == MALE)
		random_name = "[pick(first_names_male_pmc)]"
	else
		random_name = "[pick(first_names_female_pmc)]"

	if(new_human.gender == MALE)
		new_human.f_style = "5 O'clock Shadow"

	new_human.change_real_name(new_human, random_name)
	new_human.r_hair = 15
	new_human.g_hair = 15
	new_human.b_hair = 25
	new_human.r_eyes = 139
	new_human.g_eyes = 62
	new_human.b_eyes = 19

/datum/equipment_preset/roninsec/synth/load_race(mob/living/carbon/human/new_human)
		new_human.set_species(SYNTH_GEN_THREE)

/datum/equipment_preset/roninsec/synth/load_skills(mob/living/carbon/human/new_human)
		new_human.set_skills(/datum/skills/synthetic)
		new_human.allow_gun_usage = TRUE


//////////////INTERNAL AFFAIRS//////////////////

/datum/equipment_preset/iait
	name = JOB_IAIT_OPR
	flags = EQUIPMENT_PRESET_EXTRA
	rank = JOB_IAIT_OPR
	idtype = /obj/item/card/id/pmc/ds
	faction = FACTION_WY_DEATHSQUAD
	faction_group = FACTION_LIST_WY
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	var/human_versus_human = FALSE
	var/headset_type = /obj/item/device/radio/headset/distress/pmc
	skills = /datum/skills/everything
	paygrade = "IAIT-OPR"
	role_comm_title = "IAIT Operator"

//	/datum/equipment_preset/roninsec/New()
//	. = ..()
//	access = get_access(ACCESS_LIST_WY_PMC)


/datum/equipment_preset/iait/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(MALE,FEMALE)
	var/random_name
	var/first_name
	var/last_name
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	if(new_human.gender == MALE)
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_male_pmc)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		if(prob(10))
			first_name = "[capitalize(randomly_generate_japanese_word(rand(2, 3)))]"
		else
			first_name = "[pick(first_names_female_pmc)]"
	if(prob(25))
		last_name = "[capitalize(randomly_generate_japanese_word(rand(2, 4)))]"
	else
		last_name = "[pick(last_names_pmc)]"
	random_name = "[first_name] [last_name]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(25,35)
	new_human.h_style = "Shaved Head"
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/roninsec/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
			uniform.sensor_faction = FACTION_WY_DEATHSQUAD
	return ..()

/datum/equipment_preset/iait/tl
	name = JOB_IAIT_TL
	rank = JOB_IAIT_OPR
	paygrade = "IAIT-TL"
	role_comm_title = "IAIT Team Leader"
