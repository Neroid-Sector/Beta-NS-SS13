//stuff
/obj/item/stack/concertina_wire
	name = "Coil of concertina wire"
	desc = "A rolled up spool of razor wire"
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "deployable_fence"
	w_class = SIZE_SMALL
	max_amount = 50
	var/deployconcertina = /obj/item/device/assembly/razorwire


/obj/item/stack/concertina_wire/attack_self(mob/user)
	..()
	var/turf/open/T = user.loc
	if(!(istype(T) && T.allow_construction))
		to_chat(user, SPAN_WARNING("[src] must be placed on a proper surface!"))
		return
	if(do_after(user, 0.5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		playsound(loc, 'sound/effects/metalhit.ogg', 25, TRUE)
		to_chat(user, SPAN_NOTICE(" You deploy [src]."))
		var/obj/item/device/assembly/razorwire/R = new deployconcertina(usr.loc)
		src.transfer_fingerprints_to(R)
		R.add_fingerprint(user)
		if (amount <= 1)
			qdel(src)
		else {
			amount = amount - 1
			update_icon()
		}


/obj/item/device/assembly/razorwire
	name = "razorwire"
	desc = "A nasty spool of razor wire. Ouch."
	icon = 'icons/obj/structures/alien/structures.dmi'
	icon_state = "resin_spike"
	density = FALSE
	opacity = FALSE
	health = 50
	layer = RESIN_STRUCTURE_LAYER
	var/damage = 15
	var/penetration = 50

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
	playsound(user.loc, 'sound/items/Wirecutter.ogg', 25, 1, 6)
