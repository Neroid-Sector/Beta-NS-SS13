/datum/job/merchant_marine/quatermaster/liberty
	title = JOB_MM_QUATERMASTER_LIBERTY
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/quatermaster/liberty

/obj/effect/landmark/start/ship_qm/liberty_star
	name = JOB_MM_QUATERMASTER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/quatermaster/liberty
