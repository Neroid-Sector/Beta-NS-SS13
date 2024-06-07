//********Concertina-Wire********/
/obj/item/stack/concertina_wire
	name = "Coil of concertina wire"
	desc = "A rolled up spool of razor wire"
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "concertina_wire"
	w_class = SIZE_SMALL
	max_amount = 50
	var/deployconcertina = /obj/structure/device/razorwire


/obj/item/stack/concertina_wire/attack_self(mob/user)
	..()
	var/turf/open/T = user.loc
	if(!(istype(T) && T.allow_construction))
		to_chat(user, SPAN_WARNING("[src] must be placed on a proper surface!"))
		return
	if(do_after(user, 0.5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		playsound(loc, 'sound/handling/smartgun_open.ogg', 25, TRUE)
		to_chat(user, SPAN_NOTICE(" You deploy [src]."))
		var/obj/structure/device/razorwire/R = new deployconcertina(usr.loc)
		src.transfer_fingerprints_to(R)
		R.add_fingerprint(user)
		if (amount <= 1)
			qdel(src)
		else {
			amount = amount - 1
			update_icon()
		}

/obj/structure/device/razorwire
	name = "razorwire"
	desc = "A nasty spool of razor wire. Ouch."
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "concertina_wire"
	density = FALSE
	anchored = FALSE
	wrenchable = TRUE
	health = 50
	layer = RESIN_STRUCTURE_LAYER
	var/damage = 12
	var/penetration = 50

	var/target_limbs = list(
		"l_leg",
		"l_foot",
		"r_leg",
		"r_foot"
	)

/obj/structure/device/razorwire/ex_act()
	qdel()

/obj/structure/device/razorwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/H = AM
	if(!istype(H))
		return

	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SUPERSLOW)
	playsound(loc, 'sound/handling/disk_pickup.ogg', 25)
	playsound(loc, 'sound/effects/rip1.ogg', 25)


/obj/item/stack/concertina_wire/full_stack
	amount = STACK_50

//********FRAG-WIRE**********/

/obj/item/stack/fragwire
	name = "Coil of explosive concertina wire"
	desc = "A rolled up spool of fragwire. A nasty thing to mix in with normal wire, it explodes into fragments when touched due to a volitile explosive compound in its core. !!!USE WITH CAUTION!!!"
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "frag_wire"
	w_class = SIZE_SMALL
	max_amount = 25
	var/deployfragconcertina = /obj/item/explosive/fragwire


/obj/item/stack/fragwire/attack_self(mob/user)
	..()
	var/turf/open/T = user.loc
	if(!(istype(T) && T.allow_construction))
		to_chat(user, SPAN_WARNING("[src] must be placed on a proper surface!"))
		return
	if(do_after(user, 0.5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		playsound(loc, 'sound/handling/smartgun_open.ogg', 25, TRUE)
		to_chat(user, SPAN_NOTICE(" You deploy [src]."))
		var/obj/item/explosive/fragwire/R = new deployfragconcertina(usr.loc)
		src.transfer_fingerprints_to(R)
		R.add_fingerprint(user)
		if (amount <= 1)
			qdel(src)
		else {
			amount = amount - 1
			update_icon()
		}

/obj/item/explosive/fragwire
	name = "fragwire"
	desc = "A nasty spool of razor wire filled with an explosive core. When touched it detonates into a cloud of shrapnel. Ouch."
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "concertina_wire"
	density = FALSE
	anchored = FALSE
	health = 50
	layer = RESIN_STRUCTURE_LAYER
	var/damage = 12
	var/penetration = 50
	angle = 360
	use_dir = TRUE

	var/target_limbs = list(
		"l_leg",
		"l_foot",
		"r_leg",
		"r_foot"
	)

/obj/item/explosive/fragwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/H = AM
	if(!istype(H))
		return

	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SUPERSLOW)
	playsound(loc, 'sound/handling/disk_pickup.ogg', 25)
	playsound(loc, 'sound/effects/zippo_close.ogg', 25)
	playsound(loc, 'sound/effects/rip1.ogg', 25)
	create_shrapnel(loc, 50, dir, angle, , cause_data)
	cell_explosion(loc, 10, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
	qdel(src)


/obj/item/stack/fragwire/full_stack
	amount = STACK_25
