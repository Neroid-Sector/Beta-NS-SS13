/datum/job/uacm/alpha_grad
	title = JOB_UACM_GRAD
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uacm/grad
	entry_message_intro = "You are a fresh UACM commissioned Ensign, entering the service through the Joint Response Forces Special Training Program.  "
	entry_message_body = "You are a former USCMC officer who was fired along with the rest of the USCMC core when the service collapsed after the Blackfire Incident. Whether you were guilty of anything and managed to squeak by in the chaos or were genuinely not complacent with the USCMCs many, many sins does not matter now that you have been granted reentry and a path towards your old rank and respect.!"
	entry_message_end = "The graduation ceremony, led by the officer who is in command of the unit you are transferring to, will begin soon. You should take a seat in the auditorium to the north of your spawn area. Good luck and welcome to the United Americas Colonial Marines."
/obj/effect/landmark/start/uacm_grad
	name = JOB_UACM_GRAD
	icon_state = "so_spawn"
	job = /datum/job/uacm/alpha_grad

/datum/job/uacm/event_rdml
	title = JOB_UACM_RDML
	gear_preset = /datum/equipment_preset/uacm/rdml

/datum/job/uacm/cmisrs_lt
	title = JOB_UACM_CMISRS_LT
	gear_preset = /datum/equipment_preset/uacm/cmisrs_lt
