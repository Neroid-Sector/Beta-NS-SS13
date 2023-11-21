/datum/job/merchant_marine/aegis/chef
	title = JOB_MM_CHEF_AEGIS
	supervisors = "your ships Quatermaster"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/chef/aegis

/obj/effect/landmark/start/ship_chef/aegis
	name = JOB_MM_CHEF_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/aegis/chef
