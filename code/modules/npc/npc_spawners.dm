/obj/structure/xenosurge_spawner
	name = "AI spawner"
	desc = "just spawnin' shit"
	opacity = FALSE
	density = FALSE
	invisibility = INVISIBILITY_OBSERVER
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
	switch(tgui_input_list(usr, "Max:[GLOB.pve_active_npc_max]\nSpawned:[GLOB.pve_active_npc_number] out of [GLOB.pve_spawner_wave_npcs_total]", "SURGE", list("Global NPC Limit","Wave NPC limit","NPCs Per Wave","Total Waves","Wave Delay")))
		if(null)
			return
		if("Global NPC Limit")
			surge_setup_value = tgui_input_number(usr, "Pick maximum npcs at once. This is a global control to prevent lag. Generally suggest leaving this alone.", "SURGE",GLOB.pve_active_npc_max,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_active_npc_max = surge_setup_value
		if("Wave NPC limit")
			surge_setup_value = tgui_input_number(usr, "How many NPCs total to summon in the next wave. Reaching this number of spawns will complete the wave. If 0, will defer to NPCs per wave and max waves, if possible.", "SURGE",GLOB.pve_spawner_wave_npcs_total,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_wave_npcs_total = surge_setup_value
		if("NPCs Per Wave")
			surge_setup_value = tgui_input_number(usr, "How many NPCs per wave. 0 to summon up to the max npc limit (or wave limit, if lower than above) and keep it there until wave limit runs out.", "SURGE",GLOB.pve_spawner_npc_per_wave,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_npc_per_wave = surge_setup_value
		if("Total Waves")
			surge_setup_value = tgui_input_number(usr, "Total waves, if applicable. Ignored if NPCs per wave is 0. Determines max NPCs if Wave NPC limit is 0.", "SURGE",GLOB.pve_spawner_waves_total,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_waves_total = surge_setup_value
		if("Wave Delay")
			surge_setup_value = tgui_input_number(usr, "Delay between waves, if applicable. Ignored if waves are ignored, duh.", "SURGE",GLOB.pve_spawner_wave_delay,timeout = 0)
			if(surge_setup_value == null) return
			GLOB.pve_spawner_wave_delay = surge_setup_value
