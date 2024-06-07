//stuff

/obj/item/device/assembly/razorwire
	name = "razorwire"
	desc = "A small cluster of bone spikes. Ouch."
	icon = 'icons/obj/structures/alien/structures.dmi'
	icon_state = "resin_spike"
	density = FALSE
	opacity = FALSE
	layer = RESIN_STRUCTURE_LAYER
	var/damage = 8
	var/penetration = 100

	var/target_limbs = list(
		"l_leg",
		"l_foot",
		"r_leg",
		"r_foot"
	)


/obj/item/device/assembly/razorwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/H = AM
	if(!istype(H))
		return

	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SLOW)
