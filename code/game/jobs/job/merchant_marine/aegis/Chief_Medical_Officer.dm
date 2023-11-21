/datum/job/merchant_marine/chief_medical_officer/aegis
	title = JOB_MM_CHIEF_MEDICAL_OFFICER_AEGIS
	supervisors = "your ships Captain"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/cmo/aegis

/obj/effect/landmark/start/ship_cmo/aegis
	name = JOB_MM_CHIEF_MEDICAL_OFFICER_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_medical_officer/aegis
