/datum/job/merchant_marine/liberty_star/captain
	title = JOB_MM_CAPTAIN_LIBERTY
	supervisors = "your factions high command"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/commander/liberty

/obj/effect/landmark/start/ship_captain/liberty_star
	name = JOB_MM_CAPTAIN_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/liberty_star/captain
