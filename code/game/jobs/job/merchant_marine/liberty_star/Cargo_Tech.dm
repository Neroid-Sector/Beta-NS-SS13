/datum/job/merchant_marine/cargo_tech/liberty
	title = JOB_MM_CARGO_TECH_LIBERTY
	total_positions = 4
	spawn_positions = 4
	supervisors = "your ships Quatermaster"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ct/liberty

/obj/effect/landmark/start/ship_ct/liberty_star
	name = JOB_MM_CARGO_TECH_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/cargo_tech/liberty
