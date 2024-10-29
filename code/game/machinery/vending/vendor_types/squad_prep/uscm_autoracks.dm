/obj/structure/machinery/auto_rack
	name = "ColMarTech Automated Armaments Storage Carousel"
	desc = "The ARMAT brand weapons rack has deceptively small storage, presenting only a limited single stack of storage clamps, the device automatically cycles to a fully stocked shelf when the current one is depleted."
	icon = 'icons/obj/structures/machinery/vending.dmi'
	icon_state = "C-TEST"
	density = TRUE
	var/allowed_type
	var/populate_type
	var/max_stored = 1
	var/initial_stored = 0
	var/restocking = FALSE

/obj/structure/machinery/auto_rack/Initialize()
	. = ..()
	if(!allowed_type)
		icon_state = "C-TEST"
		return

	if(initial_stored)
		var/i = 0
		while(i < initial_stored)
			contents += new populate_type(src)
			i++
	update_icon()

/obj/structure/machinery/auto_rack/attackby(obj/item/O, mob/user)
	if(!restocking == TRUE)
		if(istype(O, allowed_type) && contents.len < max_stored)
			user.drop_inv_item_to_loc(O, src)
			contents += O
			update_icon()

/obj/structure/machinery/auto_rack/attack_hand(mob/living/user)
	if(!restocking == TRUE)
		if(!contents.len)
			to_chat(user, SPAN_WARNING("[src] begins to restock. Stand Clear!"))
			INVOKE_ASYNC(src,TYPE_PROC_REF(/obj/structure/machinery/auto_rack/,animation_proc))
			return

	var/obj/stored_obj = contents[contents.len]
	contents -= stored_obj
	user.put_in_hands(stored_obj)
	to_chat(user, SPAN_NOTICE("You grab [stored_obj] from [src]."))
	playsound(src, "gunequip", 25, TRUE)
	update_icon()

/obj/structure/machinery/auto_rack/proc/restock()
	while(max_stored > contents.len)
		contents += new populate_type(src)
	update_icon()

/obj/structure/machinery/auto_rack/proc/animation_proc()
	restocking = TRUE
	icon_state = "[initial(icon_state)]_0"
	overlays.Cut()
	overlays += image(icon,icon_state)
	playsound(src, "sound/machines/warning-buzzer.ogg", 25)
	sleep(1)
	icon_state = "[initial(icon_state)]_restock"
	overlays.Cut()
	overlays += image(icon,icon_state)
	sleep(31)
	restock()
	overlays.Cut()
	overlays += image(icon,icon_state)
	restocking = FALSE

/obj/structure/machinery/auto_rack/update_icon()
	if(contents.len)
		icon_state = "[initial(icon_state)]_[contents.len]"
		overlays.Cut()
		overlays += image(icon,icon_state)
	else
		icon_state = "[initial(icon_state)]_0"
		overlays.Cut()
		overlays += image(icon,icon_state)


/obj/structure/machinery/auto_rack/mk1/empty
	icon_state = "mk1rack"
	max_stored = 4
	allowed_type = /obj/item/weapon/gun/rifle/m41aMK1
	populate_type = /obj/item/weapon/gun/rifle/m41aMK1

/obj/structure/machinery/auto_rack/mk1/full
	icon_state = "mk1rack"
	max_stored = 4
	initial_stored = 4
	allowed_type = /obj/item/weapon/gun/rifle/m41aMK1
	populate_type = /obj/item/weapon/gun/rifle/m41aMK1
