/datum/job/merchant_marine/liberty_star/chef
	title = JOB_MM_CHEF_LIBERTY
	supervisors = "your ships Quatermaster"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/chef/liberty

/obj/effect/landmark/start/ship_chef/liberty_star
	name = JOB_MM_CHEF_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/liberty_star/chef
