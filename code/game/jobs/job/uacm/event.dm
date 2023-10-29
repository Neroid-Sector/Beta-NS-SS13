/datum/job/uacm/alpha_grad
	title = JOB_UACM_GRAD
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uacm/grad
	entry_message_intro = "You are a graduate of the UACM Joint Response Force Special Training Program, a provisional fast track to a commissioned officer position in the newly formed UACM, open for veterans of the USCMC."
	entry_message_body = "You were unceremoniously fired from the USCMC when the formation collapsed following the revelations of Blackfire. You spent the last year either in constant government hearings, UAAC-TIS interrogations or fending off unsolicited questions about the ‘evil’ of the USCMC. Very quickly you would realize that being a USCMC closes so many doors, reintegration into civilian life seems impossible without serious help and the help is not coming - the UAAC seems to be keen on burying you all with the USCMC."
	entry_message_end = "You arrived at a small military base just on the outskirts of the New York City sprawl, invited here by your new commander. The base personnel rather lethargically point you to a half-overgrown looking bunker on the edge of the facility grounds."
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
