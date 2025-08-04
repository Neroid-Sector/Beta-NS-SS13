//===squadies===\\
//=========SL
#define SL_E4 "Cpl"
#define SL_E5 "Sgt"
#define SL_E6 "SSgt"
#define SL_E7 "GySgt"
#define SL_E8 "MSgt"
//=========Comtech
#define CT_E3 "Lcpl"
#define CT_E4 "Cpl"
//=========Medic
#define MED_E3 "Lcpl"
#define MED_E4 "Cpl"
//=========SG
#define SG_E2 "Pfc"
#define SG_E3 "Lcpl"
#define SG_E4 "Cpl"
//=========RFM
#define RFM_E1 "Pvt"
#define RFM_E2 "Pfc"
#define RFM_E3 "Lcpl"
#define RFM_E4 "Cpl"
//====non squad roles===\\
//=========PC
#define PC_O1 "2ndLT"
#define PC_O2 "1stLT"
//=========IO
#define IO_WO2 "CWO2"
#define IO_WO3 "CWO3"
#define IO_WO4 "CWO4"
#define IO_WO5 "CWO5"
#define IO_O1 "2ndLT"


//----Command---//
/datum/job/uscm/mudskipper/msco
	title = JOB_MS_CO
	total_positions = 0
	spawn_positions = 1
	supervisors = "None"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/commander
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Greetings Commander" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msco
	name = JOB_MS_CO
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msco

/datum/job/uscm/mudskipper/msco/announce_entry_message(mob/living/carbon/human/H)
	addtimer(CALLBACK(src, PROC_REF(do_announce_entry_message), H), 1.5 SECONDS)
	return ..()

/datum/job/uscm/mudskipper/msco/proc/do_announce_entry_message(mob/living/carbon/human/H)
		all_hands_on_deck("Attention all hands, [H.get_paygrade(0)] [H.real_name] on deck!")

/datum/job/uscm/mudskipper/msxo
	title = JOB_MS_XO
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commanding officer"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/xo
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "As the Adjutant you are the Commanding officer's assistant and and secretary. Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msxo
	name = JOB_MS_XO
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msxo

/datum/job/uscm/mudskipper/msxo/announce_entry_message(mob/living/carbon/human/H)
	addtimer(CALLBACK(src, PROC_REF(do_announce_entry_message), H), 1.5 SECONDS)
	return ..()

/datum/job/uscm/mudskipper/msxo/proc/do_announce_entry_message(mob/living/carbon/human/H)
		all_hands_on_deck("Attention all hands, [H.get_paygrade(0)] [H.real_name] on deck!")

/datum/job/uscm/mudskipper/mslt
	title = JOB_MS_LT
	total_positions = 4
	spawn_positions = 4
	supervisors = "the adjunct, or ranking officers"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/lt
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are a staff officer on the USS-Blackgold. You are responsible for managing the the operations on the ship.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mslt
	name = JOB_MS_LT
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mslt

/datum/job/uscm/mudskipper/msgc
	title = JOB_MS_GC
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Commanding Officer, and adjunct"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/ccommander/ground
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are a Company commander of the  502nd Engineering Corps' 4th Division 3rd brigade 15th Bat. aka. The 'Mudskippers.' You are resposible for the platoons under your command and making sure they operate at peak performance.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msgc
	name = JOB_MS_GC
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msgc

/datum/job/uscm/mudskipper/msgc/announce_entry_message(mob/living/carbon/human/H)
	addtimer(CALLBACK(src, PROC_REF(do_announce_entry_message), H), 1.5 SECONDS)
	return ..()

/datum/job/uscm/mudskipper/msgc/proc/do_announce_entry_message(mob/living/carbon/human/H)
		all_hands_on_deck("Attention all hands, [H.get_paygrade(0)] [H.real_name] on deck!")

/datum/job/uscm/mudskipper/mspc
	title = JOB_MS_PC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commanding Officer, and adjunct"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/pc
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.

	job_options = list(PC_O1 = "2ndLT", PC_O2 = "1stLT")

/datum/job/uscm/mudskipper/mspc/handle_job_options(option)
	if(option == PC_O2 )
		gear_preset = /datum/equipment_preset/uscm_mudskippers/pc/o2
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/pc

/obj/effect/landmark/start/mudskipper/mspc
	name = JOB_MS_PC
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mspc

//-----SQUAD-----///
/datum/job/uscm/mudskipper/mssl
	title = JOB_MS_SL
	total_positions = 1
	spawn_positions = 1
	supervisors = "your platoon commander, or company commander"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.

	job_options = list(SL_E4 = "Cpl", SL_E5 = "Sgt", SL_E6 = "Ssgt", SL_E7 = "GySgt", SL_E8 = "MSgt")

/datum/job/uscm/mudskipper/mssl/handle_job_options(option)
	if(option == SL_E4)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full/e4
	else if(option == SL_E6)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full/e6
	else if(option == SL_E7)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full/e7
	else if(option == SL_E8)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full/e8
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full

/obj/effect/landmark/start/mudskipper/mssl
	name = JOB_MS_SL
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mssl

/datum/job/uscm/mudskipper/msengie
	title = JOB_MS_ENGINEER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/engineer/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.


	job_options = list(CT_E3 = "Lcpl", CT_E4 = "Cpl")

/datum/job/uscm/mudskipper/msengie/handle_job_options(option)
	if(option == CT_E3)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/engineer/full/e3
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/engineer/full

/obj/effect/landmark/start/mudskipper/msengie
	name = JOB_MS_ENGINEER
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msengie

/datum/job/uscm/mudskipper/msmedic
	title = JOB_MS_MEDIC
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/medic/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.

	job_options = list(MED_E3 = "Lcpl", MED_E4 = "Cpl")

/datum/job/uscm/mudskipper/msmedic/handle_job_options(option)
	if(option == MED_E4)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/medic/full/e4
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/medic/full

/obj/effect/landmark/start/mudskipper/msmedic
	name = JOB_MS_MEDIC
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msmedic

/datum/job/uscm/mudskipper/mssg
	title = JOB_MS_SMARTGUNNER
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/sg/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
	entry_message_end = "" // Bottom paragraph. If undeclared here, prints bank account and pin.

	job_options = list(SG_E2 = "Pfc", SG_E3 = "Lcpl", SG_E4 = "Cpl")

/datum/job/uscm/mudskipper/mssg/handle_job_options(option)
	if(option == SG_E2)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/sg/full/e2
	else if(option == SG_E4)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/sg/full/e3
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/sg/full

/obj/effect/landmark/start/mudskipper/mssg
	name = JOB_MS_SMARTGUNNER
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mssg

/datum/job/uscm/mudskipper/msrfm
	title = JOB_MS_RFM
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>"//Middle paragraph. This one is typically written per role and declared here.

	job_options = list(RFM_E1 = "Pfc", RFM_E2 = "Pfc", RFM_E3 = "Lcpl", RFM_E4 = "Cpl")

/datum/job/uscm/mudskipper/msrfm/handle_job_options(option)
	if(option == RFM_E1)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full/e1
	else if(option == RFM_E3)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full/e3
	else if(option == RFM_E4)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full/e4
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full

/obj/effect/landmark/start/mudskipper/msrfm
	name = JOB_MS_RFM
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msrfm

//----------Support----------//


//IO
/datum/job/uscm/mudskipper/msio
	title = JOB_MS_INTEL
	total_positions = 2
	spawn_positions = 2
	supervisors = "the acting commanding officer"
	selection_class = "job_synth"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/intel
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Get intel.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.

	job_options = list(IO_WO2 = "CWO2", IO_WO3 = "CWO3", IO_WO4 = "CWO4", IO_WO5 = "CWO5", IO_O1 = "2ndLT")

/datum/job/uscm/mudskipper/msio/handle_job_options(option)
	if(option == IO_WO3)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/intel/wo3
	else if(option == IO_WO4)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/intel/wo4
	else if(option == IO_WO5)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/intel/wo5
	else if(option == IO_O1)
		gear_preset = /datum/equipment_preset/uscm_mudskippers/intel/o1
	else
		gear_preset = /datum/equipment_preset/uscm_mudskippers/intel

/obj/effect/landmark/start/mudskipper/msio
	name = JOB_MS_INTEL
	icon_state = "io_spawn"
	job = /datum/job/uscm/mudskipper/msio

//PILOT
/datum/job/uscm/mudskipper/mspo
	title = JOB_MS_PILOT
	total_positions = 2
	spawn_positions = 2
	supervisors = "the adjunct"
	selection_class = "job_synth "
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/po
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "He just flies the bomber.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mspo
	name = JOB_MS_PILOT
	icon_state = "po_spawn"
	job = /datum/job/uscm/mudskipper/mspo

//TANK
/datum/job/uscm/mudskipper/msvc
	title = JOB_MS_CREWMAN
	total_positions = 0
	spawn_positions = 0
	supervisors = "the platoon commander"
	selection_class = "job_synth "
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/tank
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Drive Tank.  Ensure that you read SOP <a href='https://neroid-sector.com/wiki/index.php?title=Mudskippers_SOP'>" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msvc
	name = JOB_MS_PILOT
	icon_state = "po_spawn"
	job = /datum/job/uscm/mudskipper/msvc
