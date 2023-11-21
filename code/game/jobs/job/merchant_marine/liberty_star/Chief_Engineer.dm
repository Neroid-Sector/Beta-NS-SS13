/datum/job/merchant_marine/liberty_star/chief_engineer
	title = JOB_MM_CHIEF_ENGINEER_LIBERTY
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ce/liberty

/obj/effect/landmark/start/ship_ce/liberty_star
	name = JOB_MM_CHIEF_ENGINEER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/liberty_star/chief_engineer
