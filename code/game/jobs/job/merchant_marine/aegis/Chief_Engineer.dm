/datum/job/merchant_marine/chief_engineer/aegis
	title = JOB_MM_CHIEF_ENGINEER_AEGIS
	supervisors = "your ships Captain"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ce/aegis

/obj/effect/landmark/start/ship_ce/aegis
	name = JOB_MM_CHIEF_ENGINEER_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_engineer/aegis
