/obj/effect/adv/detector_blip
	icon = 'icons/effects/tracker_blips.dmi'
	layer = BELOW_FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE

/obj/detector_hud
	icon = 'icons/effects/motiontracker_ui.dmi'
	screen_loc = "detector:1,1"
	mouse_opacity = FALSE

#define TRACKER_RANGE 20

/obj/item/device/motiontracker/adv
	name = "M717 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. Alt Clicking will toggle the rangefinder."
	icon = 'icons/obj/items/marine-items.dmi'
	icon_state = "detector"
	item_state = "motion_detector"
	flags_atom = FPRINT | CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_MEDIUM
	inherent_traits = list(TRAIT_ITEM_NOT_IMPLANTABLE)

	var/obj/detector_hud/detector_image = new()
	var/list/blips = list()

	var/disable_range = FALSE
	var/active = FALSE

	var/time_to_detect = 2 SECONDS
	var/iff_signal = FACTION_MARINE

	var/client/last_client

	var/obj/structure/machinery/defenses/bell_tower/mt/linked_tower

/mob/var/current_detector = null

/obj/item/device/motiontracker/adv/Initialize()
	. = ..()
	update_icon()

/obj/item/device/motiontracker/adv/update_icon()
	//clear overlays
	if(overlays)
		overlays.Cut()
	else
		overlays = list()

	if(blood_overlay)
		overlays += blood_overlay

	//add toggle switch overlay
	if(disable_range)
		overlays += "+[initial(icon_state)]_long_switch"
	else
		overlays += "+[initial(icon_state)]_short_switch"

/obj/item/device/motiontracker/adv/verb/toggle_ping_range()
	set name = "Toggle Range finder"
	set category = "Object"
	set src in usr

	toggle_range(usr)

/obj/item/device/motiontracker/adv/clicked(mob/user, list/mods)
	if (isobserver(user) || isxeno(user)) return

	if (mods["alt"])
		if(!CAN_PICKUP(user, src))
			return ..()
		toggle_range(usr)
		return TRUE

	return ..()

/obj/item/device/motiontracker/adv/proc/toggle_range(mob/user)
	if(isobserver(user) || isxeno(user) || !Adjacent(user))
		return

	disable_range = !disable_range

	to_chat(user, SPAN_NOTICE("You [disable_range ? "disable" : "enable"] [src] range finder."))
	update_icon()

	playsound(usr,'sound/machines/click.ogg', 15, TRUE)

/obj/item/device/motiontracker/adv/attack_self(mob/user)
	..()

	if(active)
		turn_off(user)
		return

	turn_on(user)

/obj/item/device/motiontracker/adv/proc/turn_on(mob/user)
	if(active)
		return

	if(user.current_detector == src)
		to_chat(user, SPAN_ALERT("You are already using another tracker!"))
		return

	icon_state = "detector_on_1_old"

	playsound(src.loc, 'sound/items/detector_turn_on.ogg', 30)
	to_chat(user, SPAN_NOTICE("You activate \the [src]."))
	to_chat(user, SPAN_WARNING("You feel a strange pressure in your head, and feel a little nauseous as the [src] activates."))

	winshow(user, "detectorwindow", TRUE)
	user.client.screen += detector_image

	user.current_detector = src
	last_client = user.client

	START_PROCESSING(SSobj, src)
	active = TRUE

/obj/item/device/motiontracker/adv/proc/turn_off(mob/user)
	if(!active)
		return

	if(!user.current_detector)
		return

	icon_state = "detector"

	playsound(src.loc, 'sound/items/detector_turn_off.ogg', 30)
	to_chat(user, SPAN_NOTICE("You deactivate \the [src]."))
	to_chat(user, SPAN_WARNING("You feel the strange pressure in your head dissipate as the [src] deactivates."))

	var/client/client_to_use = user.client ? user.client : last_client
	winshow(client_to_use, "detectorwindow", FALSE)
	client_to_use.screen -= detector_image

	user.current_detector = null
	last_client = null

	STOP_PROCESSING(SSobj, src)
	active = FALSE

/obj/item/device/motiontracker/adv/dropped(mob/user)
	. = ..()
	turn_off(user)

/obj/item/device/motiontracker/adv/process(delta_time)
	playsound(loc, 'sound/items/detector_active.mp3', 60)
	flick("", detector_image)

	scan(2)

/obj/item/device/motiontracker/adv/proc/scan(delay)
	set waitfor = FALSE

	sleep(delay)
	var/mob/living/user = get_user()

	if(!user.client)
		turn_off(user)
		return

	if(user.r_hand != src && user.l_hand != src)
		turn_off(user)
		return


	for(var/blip in blips)
		user.client.screen -= blip
		qdel(blip)

	var/min_distance = INFINITY
	for(var/mob/living/L as anything in GLOB.living_mob_list)
		var/distance = get_dist(user, L)
		if(distance > TRACKER_RANGE)
			continue

		if(isrobot(L))
			continue

		var/delta = L.l_move_time + time_to_detect
		if(!L.action_busy && delta < world.time)
			continue

		if(L.get_target_lock(iff_signal))
			continue

		if(distance < min_distance)
			min_distance = distance

		var/obj/effect/adv/detector_blip/B = new /obj/effect/adv/detector_blip()
		user.client.screen += B // Add it to the radar

		B.pixel_x = (L.x - user.x) * 4 - 4 // Move ping in the right position on the radar (multiplied by the icon dimensions)
		B.pixel_y = (L.y - user.y) * 4 - 4 // -4 is a slight offset south and west

		B.screen_loc = "detector:3:[B.pixel_x],3:[B.pixel_y]"
		flick("blip", B)

	if(min_distance == INFINITY)
		return

	var/sound = 'sound/items/detector_ping.mp3'
	var/pitch = SOUND_MT_PING_HIGH - (SOUND_MT_PING_HIGH - SOUND_MT_PING_LOW) / 1.5 * (min_distance / TRACKER_RANGE)
	var/notice_dist = (min_distance * 5) / 3.28084
	playsound(loc, sound, 30, pitch, 5)
	if(prob(10))
		to_chat(user, SPAN_WARNING("You feel the thump of the sonar in your chest."))
	if(prob(5))
		to_chat(user, SPAN_WARNING("You hear a strange clicking inside your head, and feel a little nauseous."))
	if(prob(2))
		to_chat(user, SPAN_WARNING("You hear a strange clicking inside your head, and feel an unpleasent pressure in your eyes."))
	if(prob(1))
		to_chat(user, SPAN_WARNING("The ping of the sonar getting a hit makes the hairs on the back of your neck stand on end."))

	if(disable_range)
		return
	else
		to_chat(user, SPAN_NOTICE("Range: [notice_dist] meters."))

/obj/item/device/motiontracker/adv/proc/get_user()
	if(isliving(loc))
		return loc

/obj/item/device/motiontracker/adv/proc/apply_debuff(mob/M)
	return

/obj/item/device/motiontracker/adv/sg

/obj/item/device/motiontracker/adv/m717
	name = "M717 pocket motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. Alt Clicking will toggle the rangefinder. This prototype motion tracker is so small it can even fit in pockets."
	icon_state = "pocket"
	item_state = "motion_detector"
	flags_atom = FPRINT| CONDUCT
	flags_equip_slot = SLOT_WAIST
	w_class = SIZE_SMALL


/obj/item/device/motiontracker/adv/m717/hacked/contractor
	name = "modified M717 pocket motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures.This prototype motion tracker is so small it can even fit in pockets. This one has been modified with an after-market IFF sensor to filter out Vanguard's Arrow Incorporated signals instead of USCM ones. Displays an output to linked augmented reality HUDs."
	iff_signal = FACTION_CONTRACTOR

/obj/item/device/motiontracker/adv/hacked/upp
	name = "modified T-17 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been configured to detect all non-UPP movement."
	iff_signal = FACTION_UPP

/obj/item/device/motiontracker/adv/hacked/elite_merc
	name = "modified T-17 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been hacked to detect all non-freelancer movement instead. Fight fire with fire!"
	iff_signal = FACTION_MERCENARY

/obj/item/device/motiontracker/adv/hacked/pmc
	name = "corporate M717 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been modified with after-market IFF sensors to detect all non-PMC movement instead. For the company!."
	iff_signal = FACTION_PMC

/obj/item/device/motiontracker/adv/hacked/dutch
	name = "modified M717 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been modified with after-market IFF sensors to detect all non-Dutch's Dozen movement instead. Fight fire with fire!"
	iff_signal = FACTION_DUTCH

/obj/item/device/motiontracker/adv/hacked/contractor
	name = "modified M717 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been modified with after-market IFF sensors to detect all non-Vanguard's Arrow Incorporated movement instead."
	iff_signal = FACTION_CONTRACTOR

/obj/item/device/motiontracker/adv/hacked/clf
	name = "hacked T-17 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one's been hacked to detect all non-insurgent movement instead. DOWN WITH THE SYSTEM!"
	iff_signal = FACTION_CLF

/obj/item/device/motiontracker/adv/hacked/twe
	name = "modified M717 motion tracker"
	desc = "A device that detects movement using sonar, but will try to filter out the movement of friendly IFF signatures. This one has been configured to detect all non TWE movement."
	iff_signal = FACTION_TWE

#undef TRACKER_RANGE
