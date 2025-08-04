/obj/item/clothing/suit/storage/marine/bombvest
	name = "juryrigged explosive vest"
	desc = "Obviously someone just strapped a bomb to a harness and called it a day. It has a common light switch used as the detonator. <span class='warning'>This harness has no light, toggling it will detonate the vest! </span>"
	icon = 'icons/obj/items/clothing/suits/misc_ert.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/clothing/suits/misc_ert.dmi',
	)
	icon_state = "bomb_vest"
	item_state = "bomb_vest"
	item_state_slots = list(WEAR_JACKET = "bomb_vest")
	armor_melee = CLOTHING_ARMOR_NONE
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_melee = CLOTHING_ARMOR_NONE
	armor_bullet = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	storage_slots = 1
	slowdown = 0
	flags_atom = NO_GAMEMODE_SKIN|NO_NAME_OVERRIDE
	var/datum/cause_data/cause_data
	var/det_time = 3 SECONDS
	var/active = FALSE


/obj/item/clothing/suit/storage/marine/bombvest/proc/activate(mob/user = null)
	if(active)
		return
	else
		active = TRUE
		det_time ? addtimer(CALLBACK(src, PROC_REF(prime)), det_time) : prime()
		update_icon()
		playsound(loc, 'sound/effects/bomb_armed.mp3', 100, , 10)

/obj/item/clothing/suit/storage/marine/bombvest/proc/prime()

	create_shrapnel(loc, 12, , , , cause_data)
	cell_explosion(loc, 300, 100, EXPLOSION_FALLOFF_SHAPE_LINEAR, , cause_data)
	qdel(src)

/obj/item/clothing/suit/storage/marine/bombvest/proc/can_use_bomb_vest(mob/living/carbon/human/user)

	if(!user.IsAdvancedToolUser())
		to_chat(user, SPAN_WARNING("You don't have the dexterity to do this!"))
		return FALSE

	if(ishuman(user) && !user.allow_gun_usage)
		to_chat(user, SPAN_WARNING("Your programming prevents you from using this!"))
		return FALSE

	if(user.wear_suit != src)
		balloon_alert(user, "Can only be detonated while worn")
		return FALSE

	return TRUE

/obj/item/clothing/suit/storage/marine/bombvest/attack_self(mob/user)
	if(active)
		return

	if(!can_use_bomb_vest(user))
		return

	add_fingerprint(user)

	activate(user)

	cause_data = create_cause_data(initial(name), user)

	user.visible_message(SPAN_WARNING("[user] primes \a [name]!"),
	SPAN_WARNING("You prime \a [name]!"))
	msg_admin_attack("[key_name(user)] primed \a grenade ([name]) in [get_area(src)] ([src.loc.x],[src.loc.y],[src.loc.z]).", src.loc.x, src.loc.y, src.loc.z)
	user.attack_log += text("\[[time_stamp()]\] <font color='red'> [key_name(user)] primed \a grenade ([name]) at ([src.loc.x],[src.loc.y],[src.loc.z])</font>")

/obj/item/clothing/suit/storage/marine/bombvest/update_icon()
	if(active)
		overlays+=new/obj/effect/overlay/danger
	. = ..()
