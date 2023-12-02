/datum/job/merchant_marine/maint_tech/liberty
	title = JOB_MM_MAINTENANCE_TECH_LIBERTY
	total_positions = 4
	spawn_positions = 4
	supervisors = "your ships Chief Engineer"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/mt/liberty

/obj/effect/landmark/start/ship_mt/liberty_star
	name = JOB_MM_MAINTENANCE_TECH_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/maint_tech/liberty
