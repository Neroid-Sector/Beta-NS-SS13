#define QM_E7 "GySgt"
#define QM_W1 "WO"
#define QM_WO2 "CWO2"
#define QM_WO3 "CWO3"
#define QM_WO4 "CWO4"
#define QM_WO5 "CWO5"
#define QM_O1 "2ndLT"
#define QM_O2 "1stLT"

/datum/job/logistics/requisition
	title = JOB_CHIEF_REQUISITION
	selection_class = "job_qm"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/qm
	entry_message_body = "<a href='"+WIKI_PLACEHOLDER+"'>Your job</a> is to dispense supplies to the marines, including weapon attachments. Your cargo techs can help you out, but you have final say in your department. Ensure you have marines sign the appropriate paperwork prior to deployment. A well doccumented and operated ship is a happy ship."

	job_options = list(QM_E7 = "GySgt", QM_W1 = "WO", QM_WO2 = "CWO2", QM_WO3 = "CWO3", QM_WO4 = "CWO4", QM_WO5 = "CWO5", QM_O1 = "2ndLT", QM_O2 = "1stLT")

/datum/job/logistics/requisition/handle_job_options(option)
	if(option == QM_W1)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/cw1
	else if(option == QM_WO2)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/cw2
	else if(option == QM_WO3)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/cw3
	else if(option == QM_WO4)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/cw4
	else if(option == QM_WO3)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/cw5
	else if(option == QM_O1)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/o1
	else if(option == QM_O2)
		gear_preset = /datum/equipment_preset/uscm_ship/qm/o2
	else
		gear_preset = /datum/equipment_preset/uscm_ship/qm

/obj/effect/landmark/start/requisition
	name = JOB_CHIEF_REQUISITION
	icon_state = "ro_spawn"
	job = /datum/job/logistics/requisition
