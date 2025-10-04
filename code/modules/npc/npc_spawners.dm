/obj/structure/xenosurge_spawner
	name = "AI spawner"
	desc = "just spawnin' shit"
	opacity = FALSE
	density = FALSE
	invisibility = INVISIBILITY_OBSERVER
	icon = 'icons/obj/structures/bonfire.dmi'
	icon_state = "brazier"
	unacidable = TRUE
	unslashable = TRUE
	var/spawner_initiated = FALSE
	var/spawner_id

/obj/structure/xenosurge_spawner/Initialize(mapload, ...)
	GLOB.pve_spawner_number += 1
	GLOB.pve_active_spawners.Add(src)
	spawner_initiated = TRUE
	. = ..()

/obj/structure/xenosurge_spawner/Destroy()
	spawner_initiated = 0
	GLOB.pve_spawner_number -= 1
	GLOB.pve_active_spawners.Remove(src)
	. = ..()

//Associated commands/loops

/client/proc/create_spawner()

	set category = "DM.Xenosurge"
	set name = "Spawners - Create Action"
	set desc = "Starts the spawner creation loop."

	if(!check_rights(R_ADMIN))
		return
	var/spawner_cycle
	spawner_cycle = tgui_alert(usr, "Move your ghost to the postion of the spawner and press OK. Cancel to cancel.","SPAWNER",list("Cancel","OK"), timeout = 0)
	while(spawner_cycle == "OK")
		var/turf/spawner_turf = mob.loc
		new /obj/structure/xenosurge_spawner/(spawner_turf)
		spawner_cycle = tgui_alert(usr, "Move your ghost to the postion of the spawner and press OK. Cancel to cancel.","SPAWNER",list("Cancel","OK"), timeout = 0)
	return

/client/proc/setup_surge()
	set category = "DM.Xenosurge"
	set name = "Surge - Setup"
	set desc = "Sets parameters for next wave surge."

	if(!check_rights(R_ADMIN))
		return
	var/surge_setup_value
	switch(tgui_input_list(usr, "Max:[GLOB.pve_active_npc_max]\nSpawned:[GLOB.pve_active_npc_number] out of [GLOB.pve_spawner_wave_npcs_total]", "SURGE", list("Global NPC Limit","Wave NPC limit","Wave Delay")))
		if(null)
			return
		if("Global NPC Limit")
			surge_setup_value = tgui_input_number(usr, "Pick maximum npcs at once. This is a global control to prevent lag. Generally suggest leaving this alone.", "SURGE",GLOB.pve_active_npc_max,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_active_npc_max = surge_setup_value
		if("Wave NPC limit")
			surge_setup_value = tgui_input_number(usr, "How many NPCs total to summon in the next wave.", "SURGE",GLOB.pve_spawner_wave_npcs_total,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_wave_npcs_total = surge_setup_value
		if("Wave Delay")
			surge_setup_value = tgui_input_number(usr, "Delay between waves, set to 0 to always keep npcs up to global limit", "SURGE",GLOB.pve_spawner_wave_delay,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_wave_delay = surge_setup_value

/client/proc/setup_npcs()
	set category = "DM.Xenosurge"
	set name = "Surge - NPC Setup"
	set desc = "Sets parameters for surge NPCs."

	if(!check_rights(R_ADMIN))
		return
	var/npc_setup_value
	switch(tgui_input_list(usr, "Attack Max:[GLOB.pve_npc_attack_upper] Attack Min:[GLOB.pve_npc_attack_lower]\nMove Speed:[GLOB.pve_npc_movement_time] Attack Cadence:[GLOB.pve_npc_attack_cadence]" , "NPC", list("Attack Min","Attack Max","Move Speed","Cadence")))
		if(null)
			return
		if("Attack Min")
			npc_setup_value = tgui_input_number(usr, "Edit Minimum damage value.", "NPC",GLOB.pve_npc_attack_lower,timeout = 0)
			if(npc_setup_value == null) return
			GLOB.pve_npc_attack_lower = npc_setup_value
		if("Attack Max")
			npc_setup_value = tgui_input_number(usr, "Edit Maximum damage value.", "NPC",GLOB.pve_npc_attack_upper,timeout = 0)
			if(npc_setup_value == null) return
			GLOB.pve_npc_attack_upper = npc_setup_value
		if("Move Speed")
			npc_setup_value = tgui_input_number(usr, "Edit Movement Speed.", "NPC",GLOB.pve_npc_movement_time,timeout = 0)
			if(npc_setup_value == null) return
			GLOB.pve_npc_movement_time = npc_setup_value
		if("Cadence")
			npc_setup_value = tgui_input_number(usr, "Edit Attack Cadence.", "NPC",GLOB.pve_npc_attack_cadence,timeout = 0)
			if(npc_setup_value == null) return
			GLOB.pve_npc_attack_cadence = npc_setup_value

/proc/surge_loop()

	while(GLOB.pve_active_wave == 1)
		for (var/obj/structure/xenosurge_spawner/spawner in GLOB.pve_active_spawners)
			if(!spawner)
				GLOB.pve_active_wave = 0
				return
			if(GLOB.pve_active_npc_number < GLOB.pve_active_npc_max)
				var/turf/spawner_turf = get_turf(spawner)
				new /mob/living/npc/xeno_test(spawner_turf)
				GLOB.pve_spawned_npcs_in_wave += 1
				if(GLOB.pve_spawned_npcs_in_wave >= GLOB.pve_spawner_wave_npcs_total)
					GLOB.pve_active_wave = 0
					GLOB.pve_spawned_npcs_in_wave = 0
					message_admins("Surge NPC limit reached. Surge finished.")
					return
				if(GLOB.pve_spawner_wave_delay != 0)
					stoplag(GLOB.pve_spawner_wave_delay)
				else
					stoplag(1)
			else
				stoplag(5)



/client/proc/start_surge()
	set category = "DM.Xenosurge"
	set name = "Surge - Start"
	set desc = "Start Surge Wave."

	if(!check_rights(R_ADMIN))
		return

	if(GLOB.pve_active_wave == 1)
		to_chat(usr, "Error: Surge in progress already.")
		return

	if(GLOB.pve_active_wave == 0)
		GLOB.pve_active_wave = 1
		INVOKE_ASYNC(src, PROC_REF(surge_loop))
		message_admins("Surge Started")
		return

/client/proc/stop_surge()
	set category = "DM.Xenosurge"
	set name = "Surge - Stop"
	set desc = "Stop Surge Wave."

	if(!check_rights(R_ADMIN))
		return

	if(GLOB.pve_active_wave == 0)
		to_chat(usr, "Error: No Surge in progress")
		return

	if(GLOB.pve_active_wave == 0)
		GLOB.pve_active_wave = 0
		message_admins("Surge Stopped")
		return

/client/proc/remove_spawners()
	set category = "DM.Xenosurge"
	set name = "Surge - Remove Spawners"
	set desc = "Removes all Spawners"

	if(!check_rights(R_ADMIN))
		return

	for(var/obj/structure/xenosurge_spawner/spawner_to_delete in GLOB.pve_active_spawners)
		qdel(spawner_to_delete)

/client/proc/remove_npcs()
	set category = "DM.Xenosurge"
	set name = "Surge - Remove NPCs"
	set desc = "Removes all Spawners"

	if(!check_rights(R_ADMIN))
		return

	for(var/mob/living/npc/npc_to_delete in GLOB.pve_active_npc)
		qdel(npc_to_delete)
