/datum/job/merchant_marine/maint_tech/rubicon
	title = JOB_MM_MAINTENANCE_TECH_RUBICON
	supervisors = "your ships Chief Engineer"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/css/mt/rubicon

/obj/effect/landmark/start/ship_mt/rubicon_run
	name = JOB_MM_MAINTENANCE_TECH_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/maint_tech/rubicon
