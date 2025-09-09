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
	a_intent = INTENT_HARM
	animate_movement = NO_STEPS

	var/datum/combat_ai/ai_datum

/mob/living/npc/Initialize()
	. = ..()
	ai_datum = new(src)

/mob/living/npc/apply_damage(damage, damagetype, def_zone, used_weapon, sharp, edge, force)
	if(!damage || !damagetype) return
	ai_datum.process_damage(1, damagetype)
