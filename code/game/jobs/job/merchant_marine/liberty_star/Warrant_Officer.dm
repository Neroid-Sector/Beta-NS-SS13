/datum/job/merchant_marine/warrant_officer/liberty
	title = JOB_MM_WARRANT_OFFICER_LIBERTY
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/warrant/liberty

/obj/effect/landmark/start/ship_wo/liberty_star
	name = JOB_MM_QUATERMASTER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/warrant_officer/liberty
