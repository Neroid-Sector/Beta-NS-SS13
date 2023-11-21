/datum/job/merchant_marine/doctor/rubicon
	title = JOB_MM_DOCTOR_RUBICON
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Chief Medical Officer"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/css/doctor/rubicon

/obj/effect/landmark/start/ship_doctor/rubicon_run
	name = JOB_MM_DOCTOR_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/doctor/rubicon
