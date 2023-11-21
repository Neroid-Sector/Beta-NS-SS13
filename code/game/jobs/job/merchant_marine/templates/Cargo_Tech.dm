/datum/job/merchant_marine/cargo_tech
	title = JOB_MM_CARGO_TECH
	supervisors = "your ships Quatermaster"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ct

/obj/effect/landmark/start/ship_ct
	name = JOB_MM_CARGO_TECH
	icon_state = "x"
	job = /datum/job/merchant_marine/cargo_tech
