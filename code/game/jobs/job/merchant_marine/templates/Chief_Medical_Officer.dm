/datum/job/merchant_marine/chief_medical_officer
	title = JOB_MM_CHIEF_MEDICAL_OFFICER
	supervisors = "your ships Captain"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/cmo

/obj/effect/landmark/start/ship_cmo
	name = JOB_MM_CHIEF_MEDICAL_OFFICER
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_medical_officer
