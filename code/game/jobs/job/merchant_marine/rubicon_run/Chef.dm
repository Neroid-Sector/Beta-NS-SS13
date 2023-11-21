/datum/job/merchant_marine/rubicon_run/chef
	title = JOB_MM_CHEF_RUBICON
	supervisors = "your ships Quatermaster"
	selection_class = "job_xeno_queen"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/chef/rubicon

/obj/effect/landmark/start/ship_chef/rubicon_run
	name = JOB_MM_CHEF_RUBICON
	icon_state = "x"
	job = /datum/job/merchant_marine/rubicon_run/chef
