
#define SSGT_VARIANT "Staff Sergeant"
#define GYSGT_VARIANT "Gunnery Sergeant"
#define MSGT_VARIANT "Master Sergeant"
#define FIRSTSGT_VARIANT "First Sergeant"

/datum/job/marine/leader
	title = JOB_SQUAD_LEADER
	total_positions = 4
	spawn_positions = 4
	supervisors = "the acting commanding officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/leader
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>You are responsible for the men and women of your squad.</a> Make sure they are on task, working together, and communicating. You are also in charge of communicating with command and letting them know about the situation first hand. Keep out of harm's way."

	job_options = list(GYSGT_VARIANT = "GYSGT", SSGT_VARIANT = "SSGT", MSGT_VARIANT = "MSGT", FIRSTSGT_VARIANT= "1SGT")

/datum/job/marine/leader/handle_job_options(option)
	if(option != GYSGT_VARIANT)
		gear_preset = /datum/equipment_preset/uscm/leader/lesser_rank
	else
		gear_preset = /datum/equipment_preset/uscm/leader

/datum/job/marine/leader/whiskey
	title = JOB_WO_SQUAD_LEADER
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/sl

AddTimelock(/datum/job/marine/leader, list(
	JOB_SQUAD_ROLES = 10 HOURS
))

/obj/effect/landmark/start/marine/leader
	name = JOB_SQUAD_LEADER
	icon_state = "leader_spawn"
	job = /datum/job/marine/leader

/obj/effect/landmark/start/marine/leader/alpha
	icon_state = "leader_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/leader/bravo
	icon_state = "leader_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/leader/charlie
	icon_state = "leader_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/leader/delta
	icon_state = "leader_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/leader/ai
	total_positions = 1
	spawn_positions = 1

#undef SSGT_VARIANT
#undef GYSGT_VARIANT
#undef MSGT_VARIANT
#undef FIRSTSGT_VARIANT
