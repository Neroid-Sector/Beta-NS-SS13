/datum/job/merchant_marine/liberty_star/chief_medical_officer
	title = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	supervisors = "your ships Captain"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/cmo/liberty

/obj/effect/landmark/start/ship_cmo/liberty_star
	name = JOB_MM_CHIEF_MEDICAL_OFFICER_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/liberty_star/chief_medical_officer
