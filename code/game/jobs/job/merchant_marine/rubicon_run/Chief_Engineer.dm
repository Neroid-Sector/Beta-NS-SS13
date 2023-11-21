/datum/job/merchant_marine/rubicon_run/chief_engineer
	title = JOB_MM_CHIEF_ENGINEER_RUBICON
	supervisors = "your ships Captain"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/ce/rubicon

/obj/effect/landmark/start/ship_ce/rubicon_run
	name = JOB_MM_CHIEF_ENGINEER_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/rubicon_run/chief_engineer
