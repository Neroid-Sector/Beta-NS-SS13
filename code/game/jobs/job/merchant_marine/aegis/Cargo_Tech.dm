/datum/job/merchant_marine/aegis/cargo_tech
	title = JOB_MM_CARGO_TECH_AEGIS
	supervisors = "your ships Quatermaster"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ct/aegis

/obj/effect/landmark/start/ship_ct/aegis
	name = JOB_MM_CARGO_TECH_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/aegis/cargo_tech
