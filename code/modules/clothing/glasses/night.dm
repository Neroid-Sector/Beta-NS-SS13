// nightvision goggles

/obj/item/clothing/glasses/night
	name = "\improper TV1 night vision goggles"
	gender = PLURAL
	desc = "A neat looking pair of civilian grade infared vision goggles."
	icon_state = "night"
	item_state = "night"
	deactive_state = "night_off"
	toggle_on_sound = 'sound/handling/toggle_nv1.ogg'
	toggle_off_sound = 'sound/handling/toggle_nv2.ogg'
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle)
	darkness_view = 12
	vision_flags = SEE_MOBS
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	fullscreen_vision = null
	eye_protection = EYE_PROTECTION_NEGATIVE

/obj/item/clothing/glasses/night/helmet //for the integrated NVGs that are in helmetgarb code
	name = "\improper M2 night vision goggles"
	desc = "The actual goggle part of the M2 night vision system."
	icon_state = "stub" //our actual icon is a part of our helmet.
	item_state = null
	vision_flags = SEE_INFRA|SEE_MOBS
	flags_item = NODROP|DELONDROP|ITEM_ABSTRACT
	flags_inventory = CANTSTRIP

/obj/item/clothing/glasses/night/M4RA
	name = "\improper M4RA Battle sight"
	gender = NEUTER
	desc = "A headset and night vision goggles system for the M4RA Battle Rifle. Allows highlighted imaging of surroundings, as well as the ability to view the suit sensor health status readouts of other marines. Click it to toggle."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "s_ghillie_goggles"
	deactive_state = "s_ghillie_goggles_0"
	vision_flags = SEE_INFRA|SEE_MOBS
	hud_type = MOB_HUD_MEDICAL_BASIC
	toggleable = TRUE
	fullscreen_vision = null
	actions_types = list(/datum/action/item_action/toggle)
	flags_item = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE

/obj/item/clothing/glasses/night/medhud
	name = "\improper Mark 4 Battle Medic sight"
	gender = NEUTER
	desc = "A headset and night vision goggles system for the M4RA Battle Rifle. Allows highlighted imaging of surroundings, as well as the ability to view the health statuses of others. Click it to toggle."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "s_ghillie_goggles"
	deactive_state = "s_ghillie_goggles_0"
	vision_flags = SEE_INFRA|SEE_MOBS
	hud_type = MOB_HUD_MEDICAL_ADVANCED
	toggleable = TRUE
	fullscreen_vision = null
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/night/m42_night_goggles
	name = "\improper M42 scout sight"
	gender = NEUTER
	desc = "A headset and night vision goggles system for the M42 Scout Rifle. Allows highlighted imaging of surroundings. Click it to toggle."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "ghillie_goggles"
	deactive_state = "ghillie_goggles_0"
	vision_flags = SEE_INFRA|SEE_MOBS
	toggleable = TRUE
	fullscreen_vision = null
	actions_types = list(/datum/action/item_action/toggle)
	flags_item = MOB_LOCK_ON_EQUIP|NO_CRYO_STORE

/obj/item/clothing/glasses/night/m42_night_goggles/spotter
	name = "\improper M42 spotter sight"
	desc = "A companion headset and night vision goggles system for USCM spotters. Allows highlighted imaging of surroundings. Click it to toggle."

/obj/item/clothing/glasses/night/m42_night_goggles/m42c
	name = "\improper M42C special operations sight"
	desc = "A specialized variation of the M42 scout sight system, intended for use with the high-power M42C anti-tank sniper rifle. Allows for highlighted imaging of surroundings, as well as detection of thermal signatures even from a great distance. Click it to toggle."
	icon_state = "s_ghillie_goggles"
	deactive_state = "s_ghillie_goggles_0"
	vision_flags = SEE_INFRA|SEE_MOBS|SEE_MOBS

/obj/item/clothing/glasses/night/m42_night_goggles/upp
	name = "\improper Type 9 commando goggles"
	gender = PLURAL
	desc = "A headset and night vision goggles system used by UPP forces. Allows highlighted imaging of surroundings. Click it to toggle."
	icon_state = "upp_goggles"
	deactive_state = "upp_goggles_0"
	req_skill = null
	req_skill_level = null

/obj/item/clothing/glasses/night/m56_goggles
	name = "\improper M56 head mounted sight"
	gender = NEUTER
	desc = "A headset and goggles system for the M56 Smartgun. Has a low-res short-range imager, allowing for view of terrain."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "m56_goggles"
	deactive_state = "m56_goggles_0"
	toggleable = TRUE
	actions_types = list(/datum/action/item_action/toggle, /datum/action/item_action/m56_goggles/far_sight)
	vision_flags = SEE_INFRA|SEE_MOBS
	fullscreen_vision = null
	req_skill = SKILL_SPEC_WEAPONS
	req_skill_level = SKILL_SPEC_SMARTGUN

	var/far_sight = FALSE
	var/obj/item/weapon/gun/smartgun/linked_smartgun = null

/obj/item/clothing/glasses/night/m56_goggles/equipped(mob/user, slot)
	if(active && slot == WEAR_EYES)
		user.add_client_color_matrix("nvg_visor", 99, color_matrix_multiply(color_matrix_saturation(0), color_matrix_from_string("#9af2f8")))
		user.overlay_fullscreen("nvg_visor", /atom/movable/screen/fullscreen/flash/noise/nvg)
		user.overlay_fullscreen("nvg_visor_blur", /atom/movable/screen/fullscreen/brute/nvg, 3)
		user.update_sight()
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/dropped(mob/living/carbon/human/user)
	if(active && istype(user))
		user.remove_client_color_matrix("nvg_visor", 1 SECONDS)
		user.clear_fullscreen("nvg_visor", 0.5 SECONDS)
		user.clear_fullscreen("nvg_visor_blur", 0.5 SECONDS)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/attack_self(mob/user)
	..()

	if(!toggleable)
		return
	if(!can_use_active_effect(user))
		to_chat(user, SPAN_WARNING("You have no idea how to use [src]."))
		return

	if(!active)
		user.remove_client_color_matrix("nvg_visor", 1 SECONDS)
		user.clear_fullscreen("nvg_visor", 0.5 SECONDS)
		user.clear_fullscreen("nvg_visor_blur", 0.5 SECONDS)
		playsound_client(user.client, toggle_off_sound, null, 75)
		return
	if(active)
		user.add_client_color_matrix("nvg_visor", 99, color_matrix_multiply(color_matrix_saturation(0), color_matrix_from_string("#9af2f8")))
		user.overlay_fullscreen("nvg_visor", /atom/movable/screen/fullscreen/flash/noise/nvg)
		user.overlay_fullscreen("nvg_visor_blur", /atom/movable/screen/fullscreen/brute/nvg, 3)
		playsound_client(user.client, toggle_on_sound, null, 75)
		return

/obj/item/clothing/glasses/night/m56_goggles/Destroy(mob/user)
	linked_smartgun = null
	disable_far_sight()
	user.remove_client_color_matrix("nvg_visor", 1 SECONDS)
	user.clear_fullscreen("nvg_visor", 0.5 SECONDS)
	user.clear_fullscreen("nvg_visor_blur", 0.5 SECONDS)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/proc/link_smartgun(mob/user)
	if(!QDELETED(user))
		linked_smartgun = locate() in user
		if(linked_smartgun)
			return TRUE
	return FALSE

/obj/item/clothing/glasses/night/m56_goggles/mob_can_equip(mob/user, slot)
	if(slot == WEAR_EYES)
		if(!link_smartgun(user))
			to_chat(user, SPAN_NOTICE("You must have your smartgun equipped to wear these."))
			return FALSE
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/equipped(mob/user, slot)
	if(slot != SLOT_EYES)
		disable_far_sight(user)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/dropped(mob/living/carbon/human/user)
	linked_smartgun = null
	disable_far_sight(user)
	return ..()

/obj/item/clothing/glasses/night/m56_goggles/proc/set_far_sight(mob/living/carbon/human/user, set_to_state = TRUE)
	if(set_to_state)
		if(user.glasses != src)
			to_chat(user, SPAN_WARNING("You can't activate far sight without wearing \the [src]!"))
			return
		if(!link_smartgun(user))
			to_chat(user, SPAN_WARNING("You can't use this without a smartgun!"))
			return
		far_sight = TRUE
		if(user)
			if(user.client)
				user.client.change_view(8, src)
		START_PROCESSING(SSobj, src)
	else
		linked_smartgun = null
		far_sight = FALSE
		if(user)
			if(user.client)
				user.client.change_view(world_view_size, src)
		STOP_PROCESSING(SSobj, src)

	var/datum/action/item_action/m56_goggles/far_sight/FT = locate(/datum/action/item_action/m56_goggles/far_sight) in actions
	if(FT)
		FT.update_button_icon()

/obj/item/clothing/glasses/night/m56_goggles/proc/disable_far_sight(mob/living/carbon/human/user)
	if(!istype(user))
		user = loc
		if(!istype(user))
			user = null
	set_far_sight(user, FALSE)

/obj/item/clothing/glasses/night/m56_goggles/process(delta_time)
	var/mob/living/carbon/human/user = loc
	if(!istype(user))
		set_far_sight(null, FALSE)
		return PROCESS_KILL
	if(!link_smartgun(user))
		set_far_sight(user, FALSE)
		return PROCESS_KILL
	if(!linked_smartgun.drain_battery(25 * delta_time))
		set_far_sight(user, FALSE)

/datum/action/item_action/m56_goggles/far_sight/New()
	. = ..()
	name = "Toggle Far Sight"
	action_icon_state = "far_sight"
	button.name = name
	button.overlays.Cut()
	button.overlays += image('icons/mob/hud/actions.dmi', button, action_icon_state)

/datum/action/item_action/m56_goggles/far_sight/action_activate()
	if(target)
		var/obj/item/clothing/glasses/night/m56_goggles/G = target
		G.set_far_sight(owner, !G.far_sight)
		to_chat(owner, SPAN_NOTICE("You [G.far_sight ? "enable" : "disable"] \the [G]'s far sight system."))

/datum/action/item_action/m56_goggles/far_sight/update_button_icon()
	if(!target)
		return
	var/obj/item/clothing/glasses/night/m56_goggles/G = target
	if(G.far_sight)
		button.icon_state = "template_on"
	else
		button.icon_state = "template"

/obj/item/clothing/glasses/night/m56_goggles/whiteout
	name = "\improper M56T head mounted sight"
	desc = "A headset and goggles system for the M56T 'Terminator' Smartgun. Has a low-light vision processor as well as a system allowing detection of thermal signatures though solid surfaces."
	vision_flags = SEE_INFRA|SEE_MOBS|SEE_MOBS

/obj/item/clothing/glasses/night/yautja
	name = "bio-mask nightvision"
	gender = NEUTER
	desc = "A vision overlay generated by the Bio-Mask. Used for low-light conditions."
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "visor_nvg"
	item_state = "securityhud"
	flags_inventory = COVEREYES
	flags_item = NODROP|DELONDROP
	fullscreen_vision = null
	actions_types = null

/obj/item/clothing/glasses/night/cultist
	name = "\improper unusual thermal imaging goggles"
	desc = "Seems to be thermal imaging goggles, except they have an unusual design. Looking at it makes you nauseous."
	icon_state = "thermal"
	item_state = "thermal"
	w_class = SIZE_SMALL
	vision_flags = SEE_MOBS
	fullscreen_vision = null

/obj/item/clothing/glasses/night/cultist/mob_can_equip(mob/user, slot)
	if(slot == WEAR_EYES)
		if(iscarbon(user))
			var/mob/living/carbon/H = user
			if(!H.hivenumber)
				to_chat(user, SPAN_WARNING("You do not want to put these on, they're making you nauseous."))
				return FALSE
	return ..()

/obj/item/clothing/glasses/night/experimental_mesons
	name = "\improper Experimental Meson Goggles"
	desc = "An improved but experimental version of the standard issue meson goggles, due to increased complexity these can only be worn by synthetics. Allows for full night vision and viewing of the surroundings. Click it to toggle."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "refurb_meson"
	deactive_state = "degoggles"
	vision_flags = SEE_INFRA|SEE_MOBS
	toggleable = TRUE
	fullscreen_vision = null
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/glasses/night/experimental_mesons/mob_can_equip(mob/user, slot)
	if(slot == WEAR_EYES)
		if(!issynth(user))
			to_chat(user, "The experimental meson goggles start probing at your eyes, searching for an attachment point, and you immediately take them off.")
			return FALSE
	return ..()

/obj/item/clothing/glasses/night/hack_goggles
	name = "\improper  M701 AR Headset"
	gender = NEUTER
	desc = "The M701 augmented-reality headset is designed to allow USCM combat technitcans to interface with computers, UAVs, security and sentry networks as well as the UA battlespace intranet data feed. Utilizing an AR overlay the system is quite bulky but allows for passthrough video feed with a link to the marine's helmet camera feed allowing the tech to keep fighting both in cyberpsace and the real world. Click it to toggle."
	icon = 'icons/obj/items/clothing/glasses.dmi'
	icon_state = "hackgoggles"
	deactive_state = "hackgoggles_0"
	vision_flags = SEE_MOBS
	toggleable = 1
	actions_types = list(/datum/action/item_action/toggle)
	eye_protection = EYE_PROTECTION_WELDING
	req_skill = SKILL_ENGINEER
	req_skill_level = SKILL_ENGINEER_TRAINED
	clothing_traits = list(TRAIT_REAGENT_SCANNER)


/obj/item/clothing/glasses/night/hack_goggles/get_examine_text(mob/user)
	. = ..()
	. += SPAN_INFO("THIS IS ITEM IS WIP AND CURRENTLY DOES NOT DO ITS INTENDED FUNCTION. Can be used as welding and reagent goggles.")

