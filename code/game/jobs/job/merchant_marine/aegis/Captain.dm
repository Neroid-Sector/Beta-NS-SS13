/datum/job/merchant_marine/aegis/captain
	title = JOB_MM_CAPTAIN_AEGIS
	supervisors = "your factions high command"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/commander/aegis

/obj/effect/landmark/start/ship_captain/aegis
	name = JOB_MM_CAPTAIN_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/aegis/captain
