/datum/job/merchant_marine/rubicon_run/doctor
	title = JOB_MM_DOCTOR_RUBICON
	supervisors = "your ships Chief Medical Officer"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/doctor/rubicon

/obj/effect/landmark/start/ship_doctor/rubicon_run
	name = JOB_MM_DOCTOR_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/rubicon_run/doctor
