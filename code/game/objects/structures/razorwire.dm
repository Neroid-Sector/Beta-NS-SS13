//********Concertina-Wire********/
/obj/item/stack/concertina_wire
	name = "Coil of concertina style razor wire"
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
	if(locate(/obj/item/explosive/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/item/explosive/atmine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/structure/device/razorwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/item/explosive/fragwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/structure/barricade) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
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
	var/dismantlewire = /obj/item/stack/concertina_wire

	var/target_limbs = list(
		"l_leg",
		"l_foot",
		"r_leg",
		"r_foot"
	)

/obj/structure/device/razorwire/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/H = AM
	if(!istype(H))
		return

	to_chat(AM, SPAN_DANGER("The barbed wire slices into you!"))
	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SUPERSLOW)
	playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 25)
	playsound(loc, 'sound/effects/rip1.ogg', 25)


/obj/structure/device/razorwire/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		if(user.action_busy)
			return
		else
			playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
			anchored = !anchored
			to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
	else
		if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS))
			if(user.action_busy)
				return
			else
				user.visible_message(SPAN_NOTICE("[user] starts cutting [src]."), \
				SPAN_NOTICE("You start cutting [src]."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops dismantling [src]."), \
					SPAN_WARNING("You stop dismantling [src]."))
				return
			user.visible_message(SPAN_NOTICE("[user] finishes dismantling [src]."), \
			SPAN_NOTICE("You finish dismantling [src]."))
			var/obj/item/stack/concertina_wire/R = new dismantlewire(usr.loc)
			src.transfer_fingerprints_to(R)
			R.add_fingerprint(user)
			qdel(src)

/obj/structure/device/razorwire/ex_act()
	if(prob(40))
		playsound(loc, 'sound/effects/clang.ogg', 100)
		qdel(src)
	else
		playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 100)


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
	if(locate(/obj/item/explosive/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/item/explosive/atmine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/structure/device/razorwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/item/explosive/fragwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/structure/barricade) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
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
	var/dismantlefragwire = /obj/item/stack/fragwire

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

	to_chat(AM, SPAN_DANGER("The barbed wire slices into you!"))
	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SUPERSLOW)
	playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 25)
	playsound(loc, 'sound/effects/zippo_close.ogg', 25)
	playsound(loc, 'sound/effects/rip1.ogg', 25)
	create_shrapnel(loc, 50, dir, angle, , cause_data)
	cell_explosion(loc, 10, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
	qdel(src)

/obj/item/explosive/fragwire/ex_act()
	create_shrapnel(loc, 50, dir, angle, , cause_data)
	cell_explosion(loc, 10, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
	qdel(src)

/obj/item/explosive/fragwire/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		if(user.action_busy)
			return
		else
			playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
			anchored = !anchored
			to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
	else
		if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS))
			if(user.action_busy)
				return
			else
				user.visible_message(SPAN_NOTICE("[user] starts cutting [src]. This will take a delicate hand."), \
				SPAN_NOTICE("You start cutting [src]. This will take a delicate hand."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops dismantling [src]."), \
					SPAN_WARNING("You stop dismantling [src]."))
				return
			if(prob(80))
				user.visible_message(SPAN_BOLDWARNING("Careful there... [user] shouldn't be tampering with [src]."), \
				SPAN_BOLDWARNING("Careful there... You shouldn't be tampering with [src]."))
				if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
					user.visible_message(SPAN_WARNING("[user] stops dismantling [src]."), \
					SPAN_BOLDWARNING("You stop dismantling [src]."))
					return
				user.visible_message(SPAN_BOLDWARNING("OH SHIT!"), \
				SPAN_BOLDWARNING("OH SHIT!"))
				playsound(loc, 'sound/effects/zippo_close.ogg', 25)
				create_shrapnel(loc, 50, dir, angle, , cause_data)
				cell_explosion(loc, 10, 20, EXPLOSION_FALLOFF_SHAPE_LINEAR, dir, cause_data)
				qdel(src)
				return
			user.visible_message(SPAN_NOTICE("[user] finishes dismantling [src]."), \
			SPAN_NOTICE("You finish dismantling [src]."))
			var/obj/item/stack/fragwire/R = new dismantlefragwire(usr.loc)
			src.transfer_fingerprints_to(R)
			R.add_fingerprint(user)
			qdel(src)


/obj/item/stack/fragwire/full_stack
	amount = STACK_25

//********Punji-sticks********/
/obj/item/stack/punjisticks
	name = "Stack of Punji Sticks"
	desc = "Punji sticks. Stick em in the ground and profit."
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "punjisticks"
	w_class = SIZE_SMALL
	max_amount = 50
	var/deploypunjisticks = /obj/structure/device/punjisticks


/obj/item/stack/punjisticks/attack_self(mob/user)
	..()

	var/turf/open/T = user.loc
	if(!(istype(T) && T.allow_construction))
		to_chat(user, SPAN_WARNING("[src] must be placed on a proper surface!"))
		return
	if(locate(/obj/item/explosive/mine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/item/explosive/atmine) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a mine at this position!"))
		return
	if(locate(/obj/structure/device/razorwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/item/explosive/fragwire) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(locate(/obj/structure/barricade) in get_turf(src))
		to_chat(user, SPAN_WARNING("There already is a barricade at this position!"))
		return
	if(do_after(user, 0.5 SECONDS, INTERRUPT_ALL, BUSY_ICON_BUILD, src))
		playsound(loc, 'sound/handling/smartgun_open.ogg', 25, TRUE)
		to_chat(user, SPAN_NOTICE(" You deploy [src]."))
		var/obj/structure/device/punjisticks/R = new deploypunjisticks(usr.loc)
		src.transfer_fingerprints_to(R)
		R.add_fingerprint(user)
		if (amount <= 1)
			qdel(src)
		else {
			amount = amount - 1
			update_icon()
		}

/obj/structure/device/punjisticks
	name = "punji-sticks"
	desc = "A nasty collection of sharpened sticks protruding from the ground. Ouch."
	icon = 'icons/obj/structures/barricades.dmi'
	icon_state = "punjisticks"
	density = FALSE
	anchored = FALSE
	wrenchable = TRUE
	health = 50
	layer = RESIN_STRUCTURE_LAYER
	var/damage = 50
	var/penetration = 50
	var/dismantlepunjisticks = /obj/item/stack/punjisticks

	var/target_limbs = list(
		"l_leg",
		"l_foot",
		"r_leg",
		"r_foot"
	)

/obj/structure/device/punjisticks/Crossed(atom/movable/AM)
	. = ..()
	var/mob/living/carbon/H = AM
	if(!istype(H))
		return

	to_chat(AM, SPAN_DANGER("The Punji sticks puncture into you!"))
	H.apply_armoured_damage(damage, penetration = penetration, def_zone = pick(target_limbs))
	H.apply_effect(3, SUPERSLOW)
	playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 25)
	playsound(loc, 'sound/effects/rip1.ogg', 25)


/obj/structure/device/punjisticks/attackby(obj/item/W, mob/user)
	if(HAS_TRAIT(W, TRAIT_TOOL_WRENCH))
		if(user.action_busy)
			return
		else
			playsound(loc, 'sound/items/Ratchet.ogg', 25, 1)
			anchored = !anchored
			to_chat(user, SPAN_NOTICE("You [anchored ? "wrench" : "unwrench"] \the [src]."))
	else
		if(HAS_TRAIT(W, TRAIT_TOOL_WIRECUTTERS))
			if(user.action_busy)
				return
			else
				user.visible_message(SPAN_NOTICE("[user] starts pulling [src] out of the ground."), \
				SPAN_NOTICE("You start cutting pulling [src] out of the ground."))
			if(!do_after(user, 30, INTERRUPT_NO_NEEDHAND, BUSY_ICON_FRIENDLY))
				user.visible_message(SPAN_WARNING("[user] stops dismantling [src]."), \
					SPAN_WARNING("You stop removing [src]."))
				return
			user.visible_message(SPAN_NOTICE("[user] finishes removing [src]."), \
			SPAN_NOTICE("You finish removing [src]."))
			var/obj/item/stack/punjisticks/R = new dismantlepunjisticks(usr.loc)
			src.transfer_fingerprints_to(R)
			R.add_fingerprint(user)
			qdel(src)

/obj/structure/device/punjisticks/ex_act()
	if(prob(40))
		playsound(loc, 'sound/effects/clang.ogg', 100)
		qdel(src)
	else
		playsound(loc, 'sound/effects/barbed_wire_movement.ogg', 100)


/obj/item/stack/punjisticks/full_stack
	amount = STACK_50
