/datum/job/merchant_marine/cargo_tech/patton
	title = JOB_MM_CARGO_TECH_PATTON
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Quatermaster"
	selection_class = "job_cl"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/css/ct/patton

/obj/effect/landmark/start/ship_ct/pattons_ghost
	name = JOB_MM_CARGO_TECH_PATTON
	icon_state = "x"
	job = /datum/job/merchant_marine/cargo_tech/patton
