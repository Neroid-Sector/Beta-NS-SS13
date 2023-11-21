/datum/job/merchant_marine/chief_engineer
	title = JOB_MM_CHIEF_ENGINEER
	supervisors = "your ships Captain"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/ce

/obj/effect/landmark/start/ship_ce
	name = JOB_MM_CHIEF_ENGINEER
	icon_state = "x"
	job = /datum/job/merchant_marine/chief_engineer
