/datum/job/merchant_marine/aegis/quatermaster
	title = JOB_MM_QUATERMASTER_AEGIS
	supervisors = "your ships Captain"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/quatermaster/aegis

/obj/effect/landmark/start/ship_qm/aegis
	name = JOB_MM_QUATERMASTER_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/aegis/quatermaster
