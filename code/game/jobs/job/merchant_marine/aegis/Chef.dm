/datum/job/merchant_marine/chef/aegis
	title = JOB_MM_CHEF_AEGIS
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Quatermaster"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/chef/aegis

/obj/effect/landmark/start/ship_chef/aegis
	name = JOB_MM_CHEF_AEGIS
	icon_state = "x"
	job = /datum/job/merchant_marine/chef/aegis
