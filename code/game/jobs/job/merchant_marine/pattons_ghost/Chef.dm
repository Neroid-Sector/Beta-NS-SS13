/datum/job/merchant_marine/chef/patton
	title = JOB_MM_CHEF_PATTON
	supervisors = "your ships Quatermaster"
	selection_class = "job_cl"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/chef/patton

/obj/effect/landmark/start/ship_chef/pattons_ghost
	name = JOB_MM_CHEF
	icon_state = "x"
	job = /datum/job/merchant_marine/chef/patton
