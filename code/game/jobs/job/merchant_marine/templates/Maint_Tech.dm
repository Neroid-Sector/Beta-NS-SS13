/datum/job/merchant_marine/maint_tech
	title = JOB_MM_MAINTENANCE_TECH
	supervisors = "your ships Chief Engineer"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/mt

/obj/effect/landmark/start/ship_mt
	name = JOB_MM_MAINTENANCE_TECH
	icon_state = "x"
	job = /datum/job/merchant_marine/maint_tech
