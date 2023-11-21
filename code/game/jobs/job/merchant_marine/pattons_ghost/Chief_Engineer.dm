/datum/job/merchant_marine/pattons_ghost/chief_engineer
	title = JOB_MM_CHIEF_ENGINEER_PATTON
	supervisors = "your ships Captain"
	selection_class = "job_cl"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADMIN_NOTIFY|ROLE_WHITELISTED
	gear_preset = /datum/equipment_preset/merchant_marine/css/ce/patton

/obj/effect/landmark/start/ship_ce/pattons_ghost
	name = JOB_MM_CHIEF_ENGINEER_PATTON
	icon_state = "x"
	job = /datum/job/merchant_marine/pattons_ghost/chief_engineer
