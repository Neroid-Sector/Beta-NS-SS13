/datum/job/merchant_marine/captain/rubicon
	title = JOB_MM_CAPTAIN_RUBICON
	supervisors = "your factions high command"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/commander/rubicon

/obj/effect/landmark/start/ship_captain/rubicon_run
	name = JOB_MM_CAPTAIN_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/captain/rubicon
