/datum/job/merchant_marine/chef/liberty
	title = JOB_MM_CHEF_LIBERTY
	total_positions = 4
	spawn_positions = 4
	supervisors = "your ships Quatermaster"
	selection_class = "job_cmp"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/chef/liberty

/obj/effect/landmark/start/ship_chef/liberty_star
	name = JOB_MM_CHEF_LIBERTY
	icon_state = "x"
	job = /datum/job/merchant_marine/chef/liberty
