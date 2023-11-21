/datum/job/merchant_marine/rubicon_run/chief_medical_officer
	title = JOB_MM_CHIEF_MEDICAL_OFFICER_RUBICON
	supervisors = "your ships Captain"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/cmo/rubicon

/obj/effect/landmark/start/ship_cmo/rubicon_run
	name = JOB_MM_CHIEF_MEDICAL_OFFICER_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/rubicon_run/chief_medical_officer
