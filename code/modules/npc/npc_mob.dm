/mob/living/npc/
	name = "npc mob subtype master"
	desc = "hi, if you're reading me, someone made a mistake. Most likely the coder. Please report this as a bug."
	icon = 'icons/mob/npc.dmi'
	icon_state = "npc"
	density = 1
	layer = MOB_LAYER
	mouse_opacity = 1
	melee_damage_lower = 5
	melee_damage_upper = 10
	wall_smash = 1
	a_intent = INTENT_HARM
	animate_movement = NO_STEPS

	var/datum/combat_ai/ai_datum

/mob/living/npc/Initialize()
	. = ..()
	ai_datum = new(src)
	GLOB.pve_active_npc.Add(src)
	GLOB.pve_active_npc_number += 1

/mob/living/npc/Destroy()
	GLOB.pve_active_npc.Remove(src)
	GLOB.pve_active_npc_number -= 1
	if(GLOB.pve_active_npc_number < 0) GLOB.pve_active_npc_number = 0
	if(ai_datum)
		qdel(ai_datum)
	ai_datum = null
	. = ..()


/mob/living/npc/apply_damage(damage, damagetype, def_zone, used_weapon, sharp, edge, force)
	if(!damage || !damagetype) return
	ai_datum.process_damage(1, damagetype)

/mob/living/npc/xeno_test

	name = "Tester Xeno"
	desc = "Ugly mfer that needs to be shot. Nuff said."
	icon = 'icons/mob/xenos/castes/tier_1/drone.dmi'
	icon_state = "Normal Drone Walking"
