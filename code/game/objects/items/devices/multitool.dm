/**
 * Multitool -- A multitool is used for hacking electronic devices.
 */

/obj/item/device/multitool
	name = "\improper Security Access Tuner" //Thats what is is in-universe. From Alien: Isolation.
	desc = "A small handheld tool with its own leather case. Used to override various machine functions. Contains loose wires for tapping in and a small computer terminal. Primarily used to pulse Airlock and APC wires on a shortwave frequency. It contains a small data buffer as well."
	icon_state = "multitool"
	item_state = "multitool"
	pickup_sound = 'sound/handling/multitool_pickup.ogg'
	drop_sound = 'sound/handling/multitool_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST

	matter = list("metal" = 50,"glass" = 20)
	inherent_traits = list(TRAIT_TOOL_MULTITOOL)
	var/hack_speed = 10 SECONDS // Only used for vendors right now
	var/next_scan

	var/list/encryption_keys = list()

/obj/item/device/multitool/proc/load_encryption_key(key, obj/object)
	encryption_keys[key] = WEAKREF(object)

/obj/item/device/multitool/proc/has_encryption_key(key)
	if(encryption_keys[key])
		return TRUE
	return FALSE

/obj/item/device/multitool/proc/remove_encryption_key(key)
	return encryption_keys.Remove(key)

/obj/item/device/multitool/attack(mob/M as mob, mob/user as mob)
	return FALSE

/obj/item/device/multitool/afterattack(atom/target, mob/user, flag)
	for(var/obj/item/explosive/plastic/E in target.contents)
		E.attackby(src, user)
		return
	. = ..()

/obj/item/device/multitool/attack_self(mob/user)
	..()

	if(world.time < next_scan || !ishuman(user) || !skillcheck(user,SKILL_ENGINEER,SKILL_ENGINEER_TRAINED))
		return

	next_scan = world.time + 15
	var/area/A = get_area(src)
	var/APC = A? A.get_apc() : null
	if(APC)
		to_chat(user, SPAN_NOTICE("The local APC is located at [SPAN_BOLD("[get_dist(src, APC)] units [dir2text(get_dir(src, APC))]")]."))
		user.balloon_alert(user, "[get_dist(src, APC)] units [dir2text(get_dir(src, APC))]")
	else
		to_chat(user, SPAN_WARNING("ERROR: Could not locate local APC."))
		user.balloon_alert(user, "could not locate!")

//advanced hacking tool

/obj/item/device/hackingdevice
	name = "\improper SSDD"
	desc = "A complex handheld tool manufactured by Seegson. Packed in its own leather case the device is able to be used to override various machine functions. Contains loose wires for tapping in and a small computer terminal. Primarily used to pulse Airlock and APC wires on a shortwave frequency. It contains a small data buffer, keyboard, and memory tape as well, all of which are affixed to the leather case."
	icon = 'icons/obj/items/devices.dmi'
	icon_state = "ssdd_closed"
	item_state = "ssdd_closed"
	pickup_sound = 'sound/handling/multitool_pickup.ogg'
	drop_sound = 'sound/handling/multitool_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST

/obj/item/device/hackingdevice/attack_self(mob/user)
	..()
	if (icon_state == "ssdd_open")
		icon_state = "ssdd_closed"
	else
		icon_state = "ssdd_open"
	update_icon()

	inherent_traits = list(TRAIT_TOOL_MULTITOOL)


/obj/item/device/voightkampf
	name = "\improper Voight-Kampff device"
	desc = "A very advanced form of lie detector that measures contractions of the iris muscle and the presence of invisible airborne particles emitted from the body. The VK is used primarily by Blade Runners and TIS agents to determine if a suspect is truly human by measuring the degree of his empathic response through carefully worded questions and statements."
	icon = 'icons/obj/items/devices.dmi'
	icon_state = "voight_off"
	item_state = "voight_off"
	pickup_sound = 'sound/handling/multitool_pickup.ogg'
	drop_sound = 'sound/handling/multitool_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST
	var/scanning = FALSE


/obj/item/device/voightkampf/attack_self(mob/user)
	..()
	if (icon_state == "voight_on")
		icon_state = "voight_off"
		scanning = FALSE
	else
		icon_state = "voight_on"
		scanning = TRUE
		voightnoise()
	update_icon()

/obj/item/device/voightkampf/proc/voightnoise()
	if(scanning)
		playsound(src,'sound/machines/click.ogg', 15, TRUE)
		cycle()
	else
		return


/obj/item/device/voightkampf/proc/cycle()
	if(scanning)
		voightnoise()
