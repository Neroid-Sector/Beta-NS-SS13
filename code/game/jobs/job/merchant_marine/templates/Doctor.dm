/datum/job/merchant_marine/doctor
	title = JOB_MM_DOCTOR
	supervisors = "your ships Chief Medical Officer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/doctor

/obj/effect/landmark/start/ship_doctor
	name = JOB_MM_DOCTOR
	icon_state = "x"
	job = /datum/job/merchant_marine/doctor
