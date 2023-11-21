/datum/job/merchant_marine/maint_tech/aegis
	title = JOB_MM_MAINTENANCE_TECH_AEGIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Chief Engineer"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/mt/aegis

/obj/effect/landmark/start/ship_mt/aegis
	name = JOB_MM_MAINTENANCE_TECH_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/maint_tech/aegis
