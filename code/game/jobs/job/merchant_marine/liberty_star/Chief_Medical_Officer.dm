/datum/job/merchant_marine/chief_medical_officer/liberty
	title = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/cmo/liberty

/obj/effect/landmark/start/ship_cmo/liberty_star
	name = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_medical_officer/liberty
