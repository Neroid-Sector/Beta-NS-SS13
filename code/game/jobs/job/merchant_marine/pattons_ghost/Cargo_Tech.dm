/datum/job/merchant_marine/pattons_ghost/cargo_tech
	title = JOB_MM_CARGO_TECH_PATTON
	supervisors = "your ships Quatermaster"
	selection_class = "job_cl"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/ct/patton

/obj/effect/landmark/start/ship_ct/pattons_ghost
	name = JOB_MM_CARGO_TECH_PATTON
	icon_state = "x"
	job = /datum/job/merchant_marine/pattons_ghost/cargo_tech
