/datum/job/merchant_marine/chief_engineer/liberty
	title = JOB_MM_CHIEF_ENGINEER_LIBERTY
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ce/liberty

/obj/effect/landmark/start/ship_ce/liberty_star
	name = JOB_MM_CHIEF_ENGINEER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_engineer/liberty
