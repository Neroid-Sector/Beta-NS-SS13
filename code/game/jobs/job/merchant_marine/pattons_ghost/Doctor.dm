/datum/job/merchant_marine/doctor/patton
	title = JOB_MM_DOCTOR_PATTON
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Chief Medical Officer"
	selection_class = "job_cl"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/css/doctor/patton

/obj/effect/landmark/start/ship_doctor
	name = JOB_MM_DOCTOR_PATTON
	icon_state = "x"
	job = /datum/job/merchant_marine/doctor/patton
