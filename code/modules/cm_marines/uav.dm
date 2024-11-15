/obj/item/uav_drone
	name = "seegson survey drone"
	desc = "An agile seegson brand drone used by to survey unexplored lands or dagerous combat zones."
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "falcon_drone"
	item_icons = "falcon_drone"
	flags_atom = FPRINT|USES_HEARING
	w_class = SIZE_SMALL


/obj/item/uav_drone/hear_talk(mob/living/sourcemob, message, verb, datum/language/language, italics)
	var/mob/hologram/uav/hologram = loc
	if(!istype(hologram))
		return FALSE
	var/mob/living/carbon/human/user = hologram.owned_bracers.loc
	if(!ishuman(user) || user == sourcemob)
		return FALSE

	to_chat(user, SPAN_GREEN("Audio Relay: [sourcemob.name] [verb], <span class='[language.color]'>\"[message]\"</span>"))
	if(user && user.client && user.client.prefs && !user.client.prefs.lang_chat_disabled \
	   && !user.ear_deaf && user.say_understands(sourcemob, language))
		sourcemob.langchat_display_image(user)

	return TRUE

/obj/item/uav_drone/get_examine_location(mob/living/carbon/human/wearer, mob/examiner, slot, t_he = "They", t_his = "their", t_him = "them", t_has = "have", t_is = "are")
	switch(slot)
		if(WEAR_L_EAR, WEAR_R_EAR)
			return "on [t_his] shoulder"
	return ..()

/obj/item/uav_drone/attack_self(mob/user)
	..()
	control_uav_drone()

/obj/item/uav_drone/verb/control_uav_drone()
	set name = "Control Falcon Drone"
	set desc = "Activates your falcon drone."
	set src in usr

	if(usr.is_mob_incapacitated())
		return

	var/mob/living/carbon/human/H = usr

	if(!istype(H.glasses, /obj/item/clothing/glasses/night/hack_goggles))
		to_chat(usr, SPAN_WARNING("You need your M701 AR Headset to control \the [src]!"))
		return

	var/mob/hologram/uav/hologram = new /mob/hologram/uav(usr.loc, usr, src, H.glasses)
	playsound(usr, 'sound/handling/toggle_nv1.ogg', 20)
	usr.drop_inv_item_to_loc(src, hologram)

/mob/hologram/uav
	name = "seegson survey drone"
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "falcon_drone_active"
	hud_possible = list(MOB_HUD_FACTION_USCM)
	var/obj/item/uav_drone/parent_drone
	var/obj/item/clothing/glasses/night/hack_goggles/owned_bracers
	desc = "An agile seegson brand drone used by to survey unexplored lands or dagerous combat zones."
	motion_sensed = FALSE

/mob/hologram/uav/Initialize(mapload, mob/M, obj/item/uav_drone/drone, obj/item/clothing/glasses/night/hack_goggles/bracers)
	. = ..()
	parent_drone = drone
	owned_bracers = bracers
	RegisterSignal(owned_bracers, COMSIG_ITEM_DROPPED, PROC_REF(handle_bracer_drop))
	med_hud_set_status()
	add_to_all_mob_huds()

/mob/hologram/uav/initialize_pass_flags(datum/pass_flags_container/PF)
	..()
	if(PF)
		PF.flags_pass = PASS_MOB_THRU|PASS_MOB_IS|PASS_FLAGS_FLAME
		PF.flags_can_pass_all = PASS_ALL

/mob/hologram/uav/add_to_all_mob_huds()
	var/datum/mob_hud/hud = huds[MOB_HUD_FACTION_USCM]
	hud.add_to_hud(src)

/mob/hologram/uav/remove_from_all_mob_huds()
	var/datum/mob_hud/hud = huds[MOB_HUD_FACTION_USCM]
	hud.remove_from_hud(src)

/mob/hologram/uav/med_hud_set_status()
	if(!hud_list)
		return

	var/image/holder = hud_list[MOB_HUD_FACTION_USCM]
	holder?.icon_state = "falcon_drone_active"

/mob/hologram/uav/Destroy()
	if(parent_drone)
		if(!linked_mob.equip_to_slot_if_possible(parent_drone, WEAR_L_EAR, TRUE, FALSE, TRUE, TRUE, FALSE))
			if(!linked_mob.equip_to_slot_if_possible(parent_drone, WEAR_R_EAR, TRUE, FALSE, TRUE, TRUE, FALSE))
				linked_mob.put_in_hands(parent_drone)
		parent_drone = null
	if(owned_bracers)
		UnregisterSignal(owned_bracers, COMSIG_ITEM_DROPPED)
		owned_bracers = null

	remove_from_all_mob_huds()

	return ..()

/mob/hologram/uav/ex_act()
	new /obj/item/trash/uav_drone(loc)
	QDEL_NULL(parent_drone)
	qdel(src)

/mob/hologram/uav/emp_act()
	new /obj/item/trash/uav_drone/emp(loc)
	QDEL_NULL(parent_drone)
	qdel(src)

/mob/hologram/uav/proc/handle_bracer_drop()
	SIGNAL_HANDLER

	qdel(src)

/obj/item/trash/uav_drone
	name = "seegson survey drone"
	desc = "The wreckage of a seegson drone."
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "falcon_drone_destroyed"
	flags_item = ITEM_PREDATOR

/obj/item/trash/uav_drone/emp
	name = "disabled seegson survey drone"
	desc = "An intact seegson drone. The internal electronics are completely fried."
	icon_state = "falcon_drone_emped"
