/datum/job/merchant_marine/chef
	title = JOB_MM_CHEF
	supervisors = "your ships Quatermaster"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/chef

/obj/effect/landmark/start/ship_chef
	name = JOB_MM_CHEF
	icon_state = "x"
	job = /datum/job/merchant_marine/chef
