/datum/job/merchant_marine/chief_engineer/rubicon
	title = JOB_MM_CHIEF_ENGINEER_RUBICON
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Captain"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/css/ce/rubicon

/obj/effect/landmark/start/ship_ce/rubicon_run
	name = JOB_MM_CHIEF_ENGINEER_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_engineer/rubicon
