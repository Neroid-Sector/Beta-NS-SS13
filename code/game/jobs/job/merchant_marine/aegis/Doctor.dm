/datum/job/merchant_marine/doctor/aegis
	title = JOB_MM_DOCTOR_AEGIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Chief Medical Officer"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/doctor/aegis

/obj/effect/landmark/start/ship_doctor/aegis
	name = JOB_MM_DOCTOR_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/doctor/aegis
