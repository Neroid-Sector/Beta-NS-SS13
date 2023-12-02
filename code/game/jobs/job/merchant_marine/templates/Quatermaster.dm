/datum/job/merchant_marine/quatermaster
	title = JOB_MM_QUATERMASTER
	total_positions = 1
	spawn_positions = 1
	supervisors = "your ships Captain"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/merchant_marine/uscss/quatermaster

/obj/effect/landmark/start/ship_qm
	name = JOB_MM_QUATERMASTER
	icon_state = "x"
	job = /datum/job/merchant_marine/quatermaster
