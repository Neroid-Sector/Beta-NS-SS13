/datum/job/merchant_marine/captain
	title = JOB_MM_CAPTAIN_PATTON
	total_positions = 1
	spawn_positions = 1
	supervisors = "your factions high command"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/commander/patton

/obj/effect/landmark/start/ship_captain/pattons_ghost
	name = JOB_MM_CAPTAIN_PATTON
	icon_state = "x"
	job = /datum/job/merchant_marine/pattons_ghost/captain
