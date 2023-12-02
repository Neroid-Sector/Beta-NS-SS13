/datum/job/merchant_marine/doctor/liberty
	title = JOB_MM_DOCTOR_LIBERTY
	total_positions = 3
	spawn_positions = 3
	supervisors = "your ships Chief Medical Officer"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/doctor/liberty

/obj/effect/landmark/start/ship_doctor/liberty_star
	name = JOB_MM_DOCTOR_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/doctor/liberty
