/datum/job/merchant_marine/cargo_tech/liberty
	title = JOB_MM_CARGO_TECH_LIBERTY
	supervisors = "your ships Quatermaster"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ct/liberty

/obj/effect/landmark/start/ship_ct/liberty_star
	name = JOB_MM_CARGO_TECH_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/cargo_tech/liberty
