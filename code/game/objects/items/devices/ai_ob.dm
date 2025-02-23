/obj/item/device/automated_firesupport
	name = "Automated Firesupport beacon"
	desc = "A military-issued device used to remotely link to the AI of warships in orbit, allied aircraft or nearby artillery systems and sentry networks, and coordinate a firesupport strike."
	icon = 'icons/obj/items/devices.dmi'
	icon_state = "motion0"
	item_state = "motion0"
	pickup_sound = 'sound/handling/wirecutter_pickup.ogg'
	drop_sound = 'sound/handling/wirecutter_drop.ogg'
	flags_atom = FPRINT|CONDUCT
	force = 5
	w_class = SIZE_SMALL
	throwforce = 5
	throw_range = 15
	throw_speed = SPEED_VERY_FAST

	var/activated = 0
	var/icon_activated = "motion4"
	var/fire_support = 0

/obj/item/device/automated_firesupport/attack_self(mob/user)
	..()

	if(!ishuman(user))
		return
	if(!user.mind)
		to_chat(user, "It doesn't seem to do anything for you.")
		return

	playsound(src,'sound/machines/click.ogg', 15, 1)

	var/list/support = list(
		"Howitzer Artillery support",
		"MLRS support",
		"HE Mortar Support",
		"Incindiary Mortar Support",
		"Airburst Shell Support",
		"CAS Gun run",
		"CAS Rocket Strike",
		"Orbital Strike",
		"Orbital Railgun Strike.",
		"ASAT Missile Strike",
	)

	var/fire_support_choice = tgui_input_list(user, "Select Fire support system to link to.", "Fire Support", support)

	switch(fire_support_choice)
		if("Howitzer Artillery support")
			fire_support = 0
			to_chat(usr, SPAN_ALERTWARNING("SEEK COVER HOWITZER STRIKE INBOUND!!!"))
		if("MLRS support")
			fire_support = 0
			to_chat(usr, SPAN_ALERTWARNING("SEEK COVER MISSILE STRIKE INBOUND!!!"))
		else
			return

	if(activated)
		to_chat(user, "Throw this as far as you can and get out of the splash zone!")
		return

	if(!is_ground_level(user.z))
		to_chat(user, "You have to be on the ground to use this or it won't transmit.")
		return

	activated = 1
	anchored = TRUE
	w_class = 10
	icon_state = "[icon_activated]"
	playsound(src, 'sound/effects/sos-morse-code.ogg', 15, 1)
	to_chat(user, "You activate the [src]. Now toss it, the fire support will arrive in a moment!")

