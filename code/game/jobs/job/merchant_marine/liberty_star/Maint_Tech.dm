/datum/job/merchant_marine/liberty_star/maint_tech
	title = JOB_MM_MAINTENANCE_TECH_LIBERTY
	supervisors = "your ships Chief Engineer"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/mt/liberty

/obj/effect/landmark/start/ship_mt/liberty_star
	name = JOB_MM_MAINTENANCE_TECH_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/liberty_star/maint_tech
