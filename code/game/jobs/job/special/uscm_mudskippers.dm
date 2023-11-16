//----Command---//
/datum/job/uscm/mudskipper/msco
	title = JOB_MS_CO
	total_positions = 1
	spawn_positions = 1
	supervisors = "None"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/commander
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Greetings Major Blackbriar" //Middle paragraph. This one is typically written per role and declared here.
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
	entry_message_body = "As the Adjunct you are the Commanding officer's assistant and and secretary" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msxo
	name = JOB_MS_XO
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msxo

/datum/job/uscm/mudskipper/msxo/announce_entry_message(mob/living/carbon/human/H)
	addtimer(CALLBACK(src, PROC_REF(do_announce_entry_message), H), 1.5 SECONDS)
	return ..()

/datum/job/uscm/mudskipper/msxo/proc/do_announce_entry_message(mob/living/carbon/human/H)
		all_hands_on_deck("Attention all hands, [H.get_paygrade(0)] [H.real_name] on deck!")

/datum/job/uscm/mudskipper/mscpt
	title = JOB_MS_CPT
	total_positions = 1
	spawn_positions = 1
	supervisors = "the commanding officer, and the adjunct"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/cpt
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are a staff officer on the USS-Blackgold. You are responsible for managing the the operations on the ship." //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mscpt
	name = JOB_MS_CPT
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mscpt

/datum/job/uscm/mudskipper/mscpt/announce_entry_message(mob/living/carbon/human/H)
	addtimer(CALLBACK(src, PROC_REF(do_announce_entry_message), H), 1.5 SECONDS)
	return ..()

/datum/job/uscm/mudskipper/mscpt/proc/do_announce_entry_message(mob/living/carbon/human/H)
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
	entry_message_body = "You are a staff officer on the USS-Blackgold. You are responsible for managing the the operations on the ship." //Middle paragraph. This one is typically written per role and declared here.
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
	gear_preset = /datum/equipment_preset/uscm_mudskippers/gcommander
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are a Company commander of the  502nd Engineering Corps' 4th Division 3rd brigade 15th Bat. aka. The 'Mudskippers.' You are resposible for the platoons under your command and making sure they operate at peak performance." //Middle paragraph. This one is typically written per role and declared here.
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
	total_positions = 12
	spawn_positions = 12
	supervisors = "your Company Commander"
	selection_class = "job_co"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/pc
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mspc
	name = JOB_MS_PC
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mspc

//-----SQUAD-----///
/datum/job/uscm/mudskipper/mssl
	title = JOB_MS_SL
	total_positions = 20
	spawn_positions = 20
	supervisors = "your platoon commander, or company commander"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/leader/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mssl
	name = JOB_MS_SL
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mssl

/datum/job/uscm/mudskipper/msengie
	title = JOB_MS_ENGINEER
	total_positions = 20
	spawn_positions = 20
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/engineer/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msengie
	name = JOB_MS_ENGINEER
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msengie

/datum/job/uscm/mudskipper/msmedic
	title = JOB_MS_MEDIC
	total_positions = 20
	spawn_positions = 20
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/medic/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msmedic
	name = JOB_MS_MEDIC
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msmedic

/datum/job/uscm/mudskipper/mssg
	title = JOB_MS_SMARTGUNNER
	total_positions = 20
	spawn_positions = 20
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/sg/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info" //Middle paragraph. This one is typically written per role and declared here.
	entry_message_end = "" // Bottom paragraph. If undeclared here, prints bank account and pin.
/obj/effect/landmark/start/mudskipper/mssg
	name = JOB_MS_SMARTGUNNER
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/mssg

/datum/job/uscm/mudskipper/msrfm
	title = JOB_MS_RFM
	total_positions = 20
	spawn_positions = 20
	supervisors = "the squad leader"
	selection_class = "job_special"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/rfm/full
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Read https://neroid-sector.com/wiki/index.php?title=Squad_roles for more info"//Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msrfm
	name = JOB_MS_RFM
	icon_state = "xo_spawn"
	job = /datum/job/uscm/mudskipper/msrfm

//----------Support----------//

//-----HONOR-GUARD-----///
/datum/job/uscm/mudskipper/mshsgsl
	title = JOB_MS_HGSL
	total_positions = 1
	spawn_positions = 1
	supervisors = "the CMP"
	selection_class = "job_qm "
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/hgsl
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are Responsible for the safety of the Commanding officer first, and his staff second. As well as any Person of interest aboard the ship." //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mshsgsl
	name = JOB_MS_HGSL
	icon_state = "mp_spawn"
	job = /datum/job/uscm/mudskipper/mshsgsl

/datum/job/uscm/mudskipper/msvhg
	title = JOB_MS_VHG
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Honorguard Squad leader"
	selection_class = "job_qm "
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/vhg
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are Responsible for the safety of the Commanding officer first, and his staff second. As well as any Person of interest aboard the ship." //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msvhg
	icon_state = "mp_spawn"
	job = /datum/job/uscm/mudskipper/msvhg

//-----Aux----///

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
	entry_message_body = "Get intel" //Middle paragraph. This one is typically written per role and declared here.

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
	entry_message_body = "He just flies the bomber" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mspo
	name = JOB_MS_PILOT
	icon_state = "po_spawn"
	job = /datum/job/uscm/mudskipper/mspo

//TANK
/datum/job/uscm/mudskipper/msvc
	title = JOB_MS_CREWMAN
	total_positions = 2
	spawn_positions = 2
	supervisors = "the platoon commander"
	selection_class = "job_synth "
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_mudskippers/tank
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "Drive Tank" //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msvc
	name = JOB_MS_PILOT
	icon_state = "po_spawn"
	job = /datum/job/uscm/mudskipper/mspo

//----medical----//
/datum/job/uscm/mudskipper/mscmo
	title = JOB_MS_CMO
	total_positions = 1
	spawn_positions = 1
	supervisors = "the acting commanding officer"
	selection_class = "job_cmo"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/uscm_mudskippers/medical/cmo
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are Responsible for the health and safety of personel on the ship. Make sure people stay alive, and fix up the ones who arent." //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/mscmo
	name = JOB_MS_CMO
	icon_state = "cmo_spawn"
	job = /datum/job/uscm/mudskipper/mscmo

/datum/job/uscm/mudskipper/msdoc
	title = JOB_MS_SURGEON
	total_positions = 1
	spawn_positions = 1
	supervisors = "the acting chief medical officer"
	selection_class = "job_cmo"
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT
	gear_preset = /datum/equipment_preset/uscm_ship/uscm_mudskippers/medical/doctor
	entry_message_intro = "" // Shown on roundstart and latejoin. Top paragraph. Replaced with a generic "You are a [role name]" if not included
	entry_message_body = "You are Responsible for the healthand safety of personel on the ship. Make sure people stay alive, and fix up the ones who arent." //Middle paragraph. This one is typically written per role and declared here.
/obj/effect/landmark/start/mudskipper/msdoc
	name = JOB_MS_SURGEON
	icon_state = "cmo_spawn"
	job = /datum/job/uscm/mudskipper/msdoc

