//MERCHANT MARINE

//USCSS
/datum/equipment_preset/merchant_marine/uscss
	name = "USCSS (ship roles)"
	faction = FACTION_MARINE
	faction_group = FACTION_LIST_MARINE
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH)

//HMCSS

/datum/equipment_preset/merchant_marine/hmcss
	name = "HMCSS (ship roles)"
	faction = FACTION_TWE
	faction_group = FACTION_LIST_MARINE_TWE
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)

//CSS

/datum/equipment_preset/merchant_marine/css
	name = "CSS (ship roles)"
	faction = FACTION_COLONIST
	faction_group = FACTION_LIST_COLONIST
	minimum_age = 20
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)






//CSS

		//CSS - Maint Tech
/datum/equipment_preset/merchant_marine/css/mt
	name = "CSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH
	rank = JOB_MM_MAINTENANCE_TECH
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/mt/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
	)

/datum/equipment_preset/merchant_marine/css/mt/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/mt/load_gear(mob/living/carbon/human/new_human)



		//CSS - Cargo Tech
/datum/equipment_preset/merchant_marine/css/ct
	name = "CSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH
	rank = JOB_MM_CARGO_TECH
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/ct/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
	)

/datum/equipment_preset/merchant_marine/css/ct/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/ct/load_gear(mob/living/carbon/human/new_human)



			//CSS - Chef
/datum/equipment_preset/merchant_marine/css/chef
	name = "CSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF
	rank = JOB_MM_CHEF
	paygrade = "ME1"
	role_comm_title = "O.SMN."
	minimum_age = 18
	skills = /datum/skills/css/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/chef/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
	)

/datum/equipment_preset/merchant_marine/css/chef/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/chef/load_gear(mob/living/carbon/human/new_human)








//USCSS - CAPTAIN
/datum/equipment_preset/merchant_marine/uscss/commander
	name = "USCSS Captain (CO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_CAPTAIN
	rank = JOB_MM_CAPTAIN
	paygrade = "MO4"
	role_comm_title = "Cdr."
	minimum_age = 30
	skills = /datum/skills/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/commander/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CAPTAIN, ACCESS_MARINE_PREP)

/datum/equipment_preset/merchant_marine/uscss/commander/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/commander/load_gear(mob/living/carbon/human/new_human)

//USCSS - Quatermaster
/datum/equipment_preset/merchant_marine/uscss/quatermaster
	name = "USCSS Quatermaster (QM)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_QUATERMASTER
	rank = JOB_MM_QUATERMASTER
	paygrade = "MO3"
	role_comm_title = "LtCdr."
	minimum_age = 30
	skills = /datum/skills/XO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/quatermaster/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_QUATERMASTER, ACCESS_MARINE_PREP)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/load_gear(mob/living/carbon/human/new_human)

//USCSS - Warrant Officer
/datum/equipment_preset/merchant_marine/uscss/warrant
	name = "USCSS Warrant Officer (WO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/deputy
	assignment = JOB_MM_WARRANT_OFFICER
	rank = JOB_MM_WARRANT_OFFICER
	paygrade = "MO2"
	role_comm_title = "Lt."
	minimum_age = 30
	skills = /datum/skills/CMP

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/warrant/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_WARRANT_OFFICER, ACCESS_MARINE_PREP)

/datum/equipment_preset/merchant_marine/uscss/warrant/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/warrant/load_gear(mob/living/carbon/human/new_human)

		//USCSS - Chief Medical Officer
/datum/equipment_preset/merchant_marine/uscss/cmo
	name = "USCSS Chief Medical Officer (CMO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_MEDICAL_OFFICER
	rank = JOB_MM_CHIEF_MEDICAL_OFFICER
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CMO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/cmo/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_MEDICAL, ACCESS_MARINE_PREP,)

/datum/equipment_preset/merchant_marine/uscss/cmo/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/cmo/load_gear(mob/living/carbon/human/new_human)

		//USCSS - Chief Engineer
/datum/equipment_preset/merchant_marine/uscss/ce
	name = "USCSS Chief Engineer (CE)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_ENGINEER
	rank = JOB_MM_CHIEF_ENGINEER
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CE

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/ce/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_ENGINEER, ACCESS_MARINE_PREP)

/datum/equipment_preset/merchant_marine/uscss/ce/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ce/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Doctor
/datum/equipment_preset/merchant_marine/uscss/doctor
	name = "USCSS Medical Doctor (MD)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_DOCTOR
	rank = JOB_MM_DOCTOR
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 25
	skills = /datum/skills/doctor

	minimap_icon = list("medic" = MINIMAP_ICON_COLOR_DOCTOR)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/doctor/New()
	. = ..()
	access = list(
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_RESEARCH,
		ACCESS_MARINE_SENIOR,
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_DOCTOR,
		ACCESS_MARINE_PREP,
	)

/datum/equipment_preset/merchant_marine/uscss/doctor/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/doctor/load_gear(mob/living/carbon/human/new_human)

		//USCSS - Maint Tech
/datum/equipment_preset/merchant_marine/uscss/mt
	name = "USCSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH
	rank = JOB_MM_MAINTENANCE_TECH
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/mt/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
	)

/datum/equipment_preset/merchant_marine/uscss/mt/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/mt/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Cargo Tech
/datum/equipment_preset/merchant_marine/uscss/ct
	name = "USCSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH
	rank = JOB_MM_CARGO_TECH
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/ct/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
	)

/datum/equipment_preset/merchant_marine/uscss/ct/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ct/load_gear(mob/living/carbon/human/new_human)


			//USCSS - Chef
/datum/equipment_preset/merchant_marine/uscss/chef
	name = "USCSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF
	rank = JOB_MM_CHEF
	paygrade = "ME1"
	role_comm_title = "SR."
	minimum_age = 18
	skills = /datum/skills/uscss/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/chef/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
	)

/datum/equipment_preset/merchant_marine/uscss/chef/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/chef/load_gear(mob/living/carbon/human/new_human)






//USCSS LIBERTY STAR
//USCSS LIBERTY STAR
//USCSS LIBERTY STAR
//USCSS LIBERTY STAR
//USCSS LIBERTY STAR





//USCSS - CAPTAIN - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/commander/liberty
	name = "USCSS Captain (CO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_CAPTAIN_LIBERTY
	rank = JOB_MM_CAPTAIN_LIBERTY
	paygrade = "MO4"
	role_comm_title = "Cdr."
	minimum_age = 30
	skills = /datum/skills/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/commander/liberty/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CAPTAIN, ACCESS_MARINE_PREP, ACCESS_MARINE_LIBERTY_STAR)

/datum/equipment_preset/merchant_marine/uscss/commander/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/commander/liberty/load_gear(mob/living/carbon/human/new_human)


//USCSS - Quatermaster - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/quatermaster/liberty
	name = "USCSS Quatermaster (QM)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_QUATERMASTER_LIBERTY
	rank = JOB_MM_QUATERMASTER_LIBERTY
	paygrade = "MO3"
	role_comm_title = "LtCdr."
	minimum_age = 30
	skills = /datum/skills/XO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/quatermaster/liberty/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_QUATERMASTER, ACCESS_MARINE_PREP, ACCESS_MARINE_LIBERTY_STAR)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/liberty/load_gear(mob/living/carbon/human/new_human)


//USCSS - Warrant Officer - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/warrant/liberty
	name = "USCSS Warrant Officer (WO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/deputy
	assignment = JOB_MM_WARRANT_OFFICER_LIBERTY
	rank = JOB_MM_WARRANT_OFFICER_LIBERTY
	paygrade = "MO2"
	role_comm_title = "Lt."
	minimum_age = 30
	skills = /datum/skills/CMP

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/warrant/liberty/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_WARRANT_OFFICER, ACCESS_MARINE_PREP, ACCESS_MARINE_LIBERTY_STAR)

/datum/equipment_preset/merchant_marine/uscss/warrant/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/warrant/liberty/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Chief Medical Officer - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/cmo/liberty
	name = "USCSS Chief Medical Officer (CMO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	rank = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CMO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/cmo/liberty/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_MEDICAL, ACCESS_MARINE_PREP,ACCESS_MARINE_LIBERTY_STAR)

/datum/equipment_preset/merchant_marine/uscss/cmo/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/cmo/liberty/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Chief Engineer - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/ce/liberty
	name = "USCSS Chief Engineer (CE)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_ENGINEER_LIBERTY
	rank = JOB_MM_CHIEF_ENGINEER_LIBERTY
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CE

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/ce/liberty/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_ENGINEER, ACCESS_MARINE_PREP, ACCESS_MARINE_LIBERTY_STAR)

/datum/equipment_preset/merchant_marine/uscss/ce/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ce/liberty/load_gear(mob/living/carbon/human/new_human)



		//USCSS - Doctor - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/doctor/liberty
	name = "USCSS Medical Doctor (MD)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_DOCTOR_LIBERTY
	rank = JOB_MM_DOCTOR_LIBERTY
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 25
	skills = /datum/skills/doctor

	minimap_icon = list("medic" = MINIMAP_ICON_COLOR_DOCTOR)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/doctor/liberty/New()
	. = ..()
	access = list(
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_RESEARCH,
		ACCESS_MARINE_SENIOR,
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_DOCTOR,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_LIBERTY_STAR,
	)

/datum/equipment_preset/merchant_marine/uscss/doctor/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/doctor/liberty/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Maint Tech - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/mt/liberty
	name = "USCSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH_LIBERTY
	rank = JOB_MM_MAINTENANCE_TECH_LIBERTY
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/mt/liberty/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_LIBERTY_STAR,
	)

/datum/equipment_preset/merchant_marine/uscss/mt/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/mt/liberty/load_gear(mob/living/carbon/human/new_human)



		//USCSS - Cargo Tech - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/ct/liberty
	name = "USCSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH_LIBERTY
	rank = JOB_MM_CARGO_TECH_LIBERTY
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/ct/liberty/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_LIBERTY_STAR,
	)

/datum/equipment_preset/merchant_marine/uscss/ct/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ct/liberty/load_gear(mob/living/carbon/human/new_human)



			//USCSS - Chef - LIBERTY STAR
/datum/equipment_preset/merchant_marine/uscss/chef/liberty
	name = "USCSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF_LIBERTY
	rank = JOB_MM_CHEF_LIBERTY
	paygrade = "ME1"
	role_comm_title = "SR."
	minimum_age = 18
	skills = /datum/skills/uscss/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/chef/liberty/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_LIBERTY_STAR,
	)

/datum/equipment_preset/merchant_marine/uscss/chef/liberty/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/chef/liberty/load_gear(mob/living/carbon/human/new_human)







//USCSS AEGIS
//USCSS AEGIS
//USCSS AEGIS
//USCSS AEGIS
//USCSS AEGIS





//USCSS - CAPTAIN - AEGIS
/datum/equipment_preset/merchant_marine/uscss/commander/aegis
	name = "USCSS Captain (CO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_CAPTAIN_AEGIS
	rank = JOB_MM_CAPTAIN_AEGIS
	paygrade = "MO4"
	role_comm_title = "Cdr."
	minimum_age = 30
	skills = /datum/skills/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/commander/aegis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CAPTAIN, ACCESS_MARINE_PREP, ACCESS_MARINE_AEGIS,)

/datum/equipment_preset/merchant_marine/uscss/commander/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/commander/aegis/load_gear(mob/living/carbon/human/new_human)


//USCSS - Quatermaster - AEGIS
/datum/equipment_preset/merchant_marine/uscss/quatermaster/aegis
	name = "USCSS Quatermaster (QM)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_QUATERMASTER_AEGIS
	rank = JOB_MM_QUATERMASTER_AEGIS
	paygrade = "MO3"
	role_comm_title = "LtCdr."
	minimum_age = 30
	skills = /datum/skills/XO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/quatermaster/aegis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_QUATERMASTER, ACCESS_MARINE_PREP, ACCESS_MARINE_AEGIS,)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/uscss/quatermaster/aegis/load_gear(mob/living/carbon/human/new_human)


//USCSS - Warrant Officer - AEGIS
/datum/equipment_preset/merchant_marine/uscss/warrant/aegis
	name = "USCSS Warrant Officer (WO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/deputy
	assignment = JOB_MM_WARRANT_OFFICER_AEGIS
	rank = JOB_MM_WARRANT_OFFICER_AEGIS
	paygrade = "MO2"
	role_comm_title = "Lt."
	minimum_age = 30
	skills = /datum/skills/CMP

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/warrant/aegis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_WARRANT_OFFICER, ACCESS_MARINE_PREP, ACCESS_MARINE_AEGIS,)

/datum/equipment_preset/merchant_marine/uscss/warrant/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/warrant/aegis/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Chief Medical Officer - AEGIS
/datum/equipment_preset/merchant_marine/uscss/cmo/aegis
	name = "USCSS Chief Medical Officer (CMO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_MEDICAL_OFFICER_AEGIS
	rank = JOB_MM_CHIEF_MEDICAL_OFFICER_AEGIS
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CMO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/cmo/aegis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_MEDICAL, ACCESS_MARINE_PREP, ACCESS_MARINE_AEGIS,)

/datum/equipment_preset/merchant_marine/uscss/cmo/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/cmo/aegis/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Chief Engineer - AEGIS
/datum/equipment_preset/merchant_marine/uscss/ce/aegis
	name = "USCSS Chief Engineer (CE)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_ENGINEER_AEGIS
	rank = JOB_MM_CHIEF_ENGINEER_AEGIS
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 30
	skills = /datum/skills/CE

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/ce/aegis/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_ENGINEER, ACCESS_MARINE_PREP, ACCESS_MARINE_AEGIS,)

/datum/equipment_preset/merchant_marine/uscss/ce/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ce/aegis/load_gear(mob/living/carbon/human/new_human)



		//USCSS - Doctor - AEGIS
/datum/equipment_preset/merchant_marine/uscss/doctor/aegis
	name = "USCSS Medical Doctor (MD)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_DOCTOR_AEGIS
	rank = JOB_MM_DOCTOR_AEGIS
	paygrade = "MO1"
	role_comm_title = "Lt.jg."
	minimum_age = 25
	skills = /datum/skills/doctor

	minimap_icon = list("medic" = MINIMAP_ICON_COLOR_DOCTOR)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/uscss/doctor/aegis/New()
	. = ..()
	access = list(
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_RESEARCH,
		ACCESS_MARINE_SENIOR,
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_DOCTOR,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_AEGIS,
	)

/datum/equipment_preset/merchant_marine/uscss/doctor/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/doctor/aegis/load_gear(mob/living/carbon/human/new_human)


		//USCSS - Maint Tech - AEGIS
/datum/equipment_preset/merchant_marine/uscss/mt/aegis
	name = "USCSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH_AEGIS
	rank = JOB_MM_MAINTENANCE_TECH_AEGIS
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/mt/aegis/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_AEGIS,
	)

/datum/equipment_preset/merchant_marine/uscss/mt/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/mt/aegis/load_gear(mob/living/carbon/human/new_human)



		//USCSS - Cargo Tech
/datum/equipment_preset/merchant_marine/uscss/ct/aegis
	name = "USCSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH_AEGIS
	rank = JOB_MM_CARGO_TECH_AEGIS
	paygrade = "ME2"
	role_comm_title = "SN."
	minimum_age = 18
	skills = /datum/skills/uscss/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/ct/aegis/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_AEGIS,
	)

/datum/equipment_preset/merchant_marine/uscss/ct/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/ct/aegis/load_gear(mob/living/carbon/human/new_human)



			//USCSS - Chef
/datum/equipment_preset/merchant_marine/uscss/chef/aegis
	name = "USCSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF_AEGIS
	rank = JOB_MM_CHEF_AEGIS
	paygrade = "ME1"
	role_comm_title = "SR."
	minimum_age = 18
	skills = /datum/skills/uscss/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/uscss/chef/aegis/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_AEGIS,
	)

/datum/equipment_preset/merchant_marine/uscss/chef/aegis/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/uscss/chef/aegis/load_gear(mob/living/carbon/human/new_human)







//CSS Rubicon Run
//CSS Rubicon Run
//CSS Rubicon Run
//CSS Rubicon Run
//CSS Rubicon Run




//CSS - CAPTAIN - RUBICON
/datum/equipment_preset/merchant_marine/css/commander/rubicon
	name = "CSS Captain (CO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_CAPTAIN_RUBICON
	rank = JOB_MM_CAPTAIN_RUBICON
	paygrade = "MO4"
	role_comm_title = "Cpt."
	minimum_age = 30
	skills = /datum/skills/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/commander/rubicon/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CAPTAIN, ACCESS_MARINE_PREP, ACCESS_MARINE_RUBICON_RUN)

/datum/equipment_preset/merchant_marine/css/commander/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/css/commander/rubicon/load_gear(mob/living/carbon/human/new_human)


//CSS - Quatermaster - RUBICON
/datum/equipment_preset/merchant_marine/css/quatermaster/rubicon
	name = "CSS Quatermaster (QM)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_QUATERMASTER_RUBICON
	rank = JOB_MM_QUATERMASTER_RUBICON
	paygrade = "MO3"
	role_comm_title = "C.OFF."
	minimum_age = 30
	skills = /datum/skills/XO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/quatermaster/rubicon/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_QUATERMASTER, ACCESS_MARINE_PREP, ACCESS_MARINE_RUBICON_RUN,)

/datum/equipment_preset/merchant_marine/css/quatermaster/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/css/quatermaster/rubicon/load_gear(mob/living/carbon/human/new_human)


//CSS - Warrant Officer - RUBICON
/datum/equipment_preset/merchant_marine/css/warrant/rubicon
	name = "CSS Warrant Officer (WO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/deputy
	assignment = JOB_MM_WARRANT_OFFICER_RUBICON
	rank = JOB_MM_WARRANT_OFFICER_RUBICON
	paygrade = "MO2"
	role_comm_title = "S.OFF."
	minimum_age = 30
	skills = /datum/skills/CMP

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/warrant/rubicon/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_WARRANT_OFFICER, ACCESS_MARINE_PREP, ACCESS_MARINE_RUBICON_RUN)

/datum/equipment_preset/merchant_marine/css/warrant/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/warrant/rubicon/load_gear(mob/living/carbon/human/new_human)


		//CSS - Chief Medical Officer - RUBICON
/datum/equipment_preset/merchant_marine/css/cmo/rubicon
	name = "CSS Chief Medical Officer (CMO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_MEDICAL_OFFICER_RUBICON
	rank = JOB_MM_CHIEF_MEDICAL_OFFICER_RUBICON
	paygrade = "MO1"
	role_comm_title = "D.OFF."
	minimum_age = 30
	skills = /datum/skills/CMO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/cmo/rubicon/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_MEDICAL, ACCESS_MARINE_PREP, ACCESS_MARINE_RUBICON_RUN,)

/datum/equipment_preset/merchant_marine/css/cmo/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/cmo/rubicon/load_gear(mob/living/carbon/human/new_human)


		//CSS - Chief Engineer - RUBICON
/datum/equipment_preset/merchant_marine/css/ce/rubicon
	name = "CSS Chief Engineer (CE)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_ENGINEER_RUBICON
	rank = JOB_MM_CHIEF_ENGINEER_RUBICON
	paygrade = "MO1"
	role_comm_title = "D.OFF."
	minimum_age = 30
	skills = /datum/skills/CE

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/ce/rubicon/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_ENGINEER, ACCESS_MARINE_PREP, ACCESS_MARINE_RUBICON_RUN,)

/datum/equipment_preset/merchant_marine/css/ce/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/ce/rubicon/load_gear(mob/living/carbon/human/new_human)
		//empty


		//CSS - Doctor - RUBICON
/datum/equipment_preset/merchant_marine/css/doctor/rubicon
	name = "CSS Medical Doctor (MD)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_DOCTOR_RUBICON
	rank = JOB_MM_DOCTOR_RUBICON
	paygrade = "MO1"
	role_comm_title = "P.OFF."
	minimum_age = 25
	skills = /datum/skills/doctor

	minimap_icon = list("medic" = MINIMAP_ICON_COLOR_DOCTOR)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/doctor/rubicon/New()
	. = ..()
	access = list(
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_RESEARCH,
		ACCESS_MARINE_SENIOR,
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_DOCTOR,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_RUBICON_RUN,
	)

/datum/equipment_preset/merchant_marine/css/doctor/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/doctor/rubicon/load_gear(mob/living/carbon/human/new_human)
		//empty

		//CSS - Maint Tech - RUBICON
/datum/equipment_preset/merchant_marine/css/mt/rubicon
	name = "CSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH_RUBICON
	rank = JOB_MM_MAINTENANCE_TECH_RUBICON
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/mt/rubicon/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_RUBICON_RUN,
	)

/datum/equipment_preset/merchant_marine/css/mt/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/mt/rubicon/load_gear(mob/living/carbon/human/new_human)
		//empty


		//CSS - Cargo Tech
/datum/equipment_preset/merchant_marine/css/ct/rubicon
	name = "CSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH_RUBICON
	rank = JOB_MM_CARGO_TECH_RUBICON
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/ct/rubicon/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_RUBICON_RUN,
	)

/datum/equipment_preset/merchant_marine/css/ct/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/ct/rubicon/load_gear(mob/living/carbon/human/new_human)
		//empty


			//CSS - Chef
/datum/equipment_preset/merchant_marine/css/chef/rubicon
	name = "CSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF_RUBICON
	rank = JOB_MM_CHEF_RUBICON
	paygrade = "ME1"
	role_comm_title = "O.SMN."
	minimum_age = 18
	skills = /datum/skills/css/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/chef/rubicon/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_RUBICON_RUN,
	)

/datum/equipment_preset/merchant_marine/css/chef/rubicon/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/chef/rubicon/load_gear(mob/living/carbon/human/new_human)
		//empty





//CSS PATTON'S GHOST
//CSS PATTON'S GHOST
//CSS PATTON'S GHOST
//CSS PATTON'S GHOST
//CSS PATTON'S GHOST





//CSS - CAPTAIN - PATTON'S GHOST
/datum/equipment_preset/merchant_marine/css/commander/patton
	name = "CSS Captain (CO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_CAPTAIN_PATTON
	rank = JOB_MM_CAPTAIN_PATTON
	paygrade = "MO4"
	role_comm_title = "Cpt."
	minimum_age = 30
	skills = /datum/skills/commander

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/commander/patton/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CAPTAIN, ACCESS_MARINE_PREP, ACCESS_MARINE_PATTONS_GHOST,)

/datum/equipment_preset/merchant_marine/css/commander/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/css/commander/patton/load_gear(mob/living/carbon/human/new_human)
		//empty

//css - Quatermaster
/datum/equipment_preset/merchant_marine/css/quatermaster/patton
	name = "CSS Quatermaster (QM)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/gold
	assignment = JOB_MM_QUATERMASTER_PATTON
	rank = JOB_MM_QUATERMASTER_PATTON
	paygrade = "MO3"
	role_comm_title = "C.OFF."
	minimum_age = 30
	skills = /datum/skills/XO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/quatermaster/patton/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_QUATERMASTER, ACCESS_MARINE_PREP, ACCESS_MARINE_PATTONS_GHOST,)

/datum/equipment_preset/merchant_marine/css/quatermaster/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/merchant_marine/css/quatermaster/patton/load_gear(mob/living/carbon/human/new_human)
		//empty

//css - Warrant Officer
/datum/equipment_preset/merchant_marine/css/warrant/patton
	name = "CSS Warrant Officer (WO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/deputy
	assignment = JOB_MM_WARRANT_OFFICER_PATTON
	rank = JOB_MM_WARRANT_OFFICER_PATTON
	paygrade = "MO2"
	role_comm_title = "S.OFF."
	minimum_age = 30
	skills = /datum/skills/CMP

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/warrant/patton/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_WARRANT_OFFICER, ACCESS_MARINE_PREP, ACCESS_MARINE_PATTONS_GHOST,)

/datum/equipment_preset/merchant_marine/css/warrant/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/warrant/patton/load_gear(mob/living/carbon/human/new_human)
		//empty

		//CSS - Chief Medical Officer
/datum/equipment_preset/merchant_marine/css/cmo/patton
	name = "CSS Chief Medical Officer (CMO)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_MEDICAL_OFFICER_PATTON
	rank = JOB_MM_CHIEF_MEDICAL_OFFICER_PATTON
	paygrade = "MO1"
	role_comm_title = "D.OFF."
	minimum_age = 30
	skills = /datum/skills/CMO

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/cmo/patton/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_MEDICAL, ACCESS_MARINE_PREP,ACCESS_MARINE_PATTONS_GHOST,)

/datum/equipment_preset/merchant_marine/css/cmo/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/cmo/patton/load_gear(mob/living/carbon/human/new_human)
		//empty

		//CSS - Chief Engineer - PATTON
/datum/equipment_preset/merchant_marine/css/ce/patton
	name = "CSS Chief Engineer (CE)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/silver
	assignment = JOB_MM_CHIEF_ENGINEER_PATTON
	rank = JOB_MM_CHIEF_ENGINEER_PATTON
	paygrade = "MO1"
	role_comm_title = "D.OFF."
	minimum_age = 30
	skills = /datum/skills/CE

	minimap_icon = list("cic" = MINIMAP_ICON_COLOR_COMMANDER)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/ce/patton/New()
	. = ..()
	access = get_access(ACCESS_LIST_MARINE_ALL, ACCESS_MARINE_CHIEF_ENGINEER, ACCESS_MARINE_PREP, ACCESS_MARINE_PATTONS_GHOST,)

/datum/equipment_preset/merchant_marine/css/ce/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/ce/patton/load_gear(mob/living/carbon/human/new_human)
		//empty


		//CSS - Doctor - PATTON
/datum/equipment_preset/merchant_marine/css/doctor/patton
	name = "CSS Medical Doctor (MD)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_DOCTOR_PATTON
	rank = JOB_MM_DOCTOR_PATTON
	paygrade = "MO1"
	role_comm_title = "P.OFF."
	minimum_age = 25
	skills = /datum/skills/doctor

	minimap_icon = list("medic" = MINIMAP_ICON_COLOR_DOCTOR)
	minimap_background = MINIMAP_ICON_BACKGROUND_CIC

/datum/equipment_preset/merchant_marine/css/doctor/patton/New()
	. = ..()
	access = list(
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MEDBAY,
		ACCESS_MARINE_RESEARCH,
		ACCESS_MARINE_SENIOR,
		ACCESS_MARINE_COMMAND,
		ACCESS_MARINE_CHEMISTRY,
		ACCESS_MARINE_MORGUE,
		ACCESS_MARINE_DOCTOR,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_PATTONS_GHOST,
	)

/datum/equipment_preset/merchant_marine/css/doctor/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/doctor/patton/load_gear(mob/living/carbon/human/new_human)
		//empty

		//CSS - Maint Tech - PATTON
/datum/equipment_preset/merchant_marine/css/mt/patton
	name = "CSS Maintenance Tech (MT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_MAINTENANCE_TECH_PATTON
	rank = JOB_MM_MAINTENANCE_TECH_PATTON
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/MT
	minimap_icon = "engi"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/mt/patton/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_OT,
		ACCESS_MARINE_MAINT_TECH,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_PATTONS_GHOST,
	)

/datum/equipment_preset/merchant_marine/css/mt/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/mt/patton/load_gear(mob/living/carbon/human/new_human)
		//empty


		//CSS - Cargo Tech - PATTON
/datum/equipment_preset/merchant_marine/css/ct/patton
	name = "CSS Cargo Tech (CT)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CARGO_TECH_PATTON
	rank = JOB_MM_CARGO_TECH_PATTON
	paygrade = "ME2"
	role_comm_title = "A.SMN."
	minimum_age = 18
	skills = /datum/skills/css/CT
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/ct/patton/New()
	. = ..()
	access = list(
		ACCESS_MARINE_ENGINEERING,
		ACCESS_CIVILIAN_ENGINEERING,
		ACCESS_MARINE_DATABASE,
		ACCESS_MARINE_MAINT,
		ACCESS_MARINE_CARGO_TECH,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_PATTONS_GHOST,
	)

/datum/equipment_preset/merchant_marine/css/ct/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/ct/patton/load_gear(mob/living/carbon/human/new_human)
		//empty


			//CSS - Chef - PATTON
/datum/equipment_preset/merchant_marine/css/chef/patton
	name = "CSS Chef (MST)"
	flags = EQUIPMENT_PRESET_START_OF_ROUND|EQUIPMENT_PRESET_MARINE

	idtype = /obj/item/card/id/data
	assignment = JOB_MM_CHEF_PATTON
	rank = JOB_MM_CHEF_PATTON
	paygrade = "ME1"
	role_comm_title = "O.SMN."
	minimum_age = 18
	skills = /datum/skills/css/mess_technician
	minimap_icon = "ct"
	minimap_background = MINIMAP_ICON_BACKGROUND_USCM

/datum/equipment_preset/merchant_marine/css/chef/patton/New()
	. = ..()
	access = list(
		ACCESS_MARINE_CHEF,
		ACCESS_MARINE_CARGO,
		ACCESS_MARINE_PREP,
		ACCESS_MARINE_KITCHEN,
		ACCESS_MARINE_PATTONS_GHOST,
	)

/datum/equipment_preset/merchant_marine/css/chef/patton/load_race(mob/living/carbon/human/new_human, client/mob_client)
	..()
	ADD_TRAIT(new_human, TRAIT_EMOTE_CD_EXEMPT, TRAIT_SOURCE_JOB)

/datum/equipment_preset/css/chef/patton/load_gear(mob/living/carbon/human/new_human)
		//empty
