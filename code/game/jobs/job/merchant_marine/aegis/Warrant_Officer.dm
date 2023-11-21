/datum/job/merchant_marine/warrant_officer/aegis
	title = JOB_MM_WARRANT_OFFICER_AEGIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Captain"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/warrant/aegis

/obj/effect/landmark/start/ship_wo/aegis
	name = JOB_MM_QUATERMASTER_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/warrant_officer/aegis
