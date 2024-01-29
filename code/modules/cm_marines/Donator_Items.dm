// SS13 DONATOR CUSTOM ITEM STORAGE ZONE OF MAGICAL HAPPINESS APOPHIS - LAST UPDATE - 14JUN2016

//#######################################################\\
//###################### TEMPLATES ######################\\
//#######################################################\\

//HEAD TEMPLATE (for Helmets/Hats/Berets)  ONLY TAKE NAME, DESC, ICON_STATE, AND ITEM_STATE.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/head/helmet/marine/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null
	//DON'T GRAB STUFF BETWEEN THIS LINE
	icon = 'icons/obj/items/clothing/hats.dmi'
	icon_override = 'icons/mob/humans/onmob/head_0.dmi'
	flags_inventory = BLOCKSHARPOBJ
	flags_inv_hide = HIDEEARS
	flags_atom = FPRINT|CONDUCT|NO_NAME_OVERRIDE|NO_SNOW_TYPE
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	flags_marine_helmet = NO_FLAGS

/obj/item/clothing/head/helmet/marine/fluff/verb/toggle_squad_markings()
	set src in usr
	if(!ishuman(usr)) return

	if(!usr.canmove || usr.stat || usr.is_mob_restrained() || !usr.loc || !isturf(usr.loc))
		to_chat(usr, SPAN_WARNING("Not right now!"))
		return

	to_chat(usr, SPAN_NOTICE("You [flags_marine_helmet & HELMET_SQUAD_OVERLAY? "hide" : "show"] the squad markings."))
	flags_marine_helmet ^= HELMET_SQUAD_OVERLAY
	usr.update_inv_head()

/obj/item/clothing/head/helmet/marine/fluff/verb/toggle_garb_overlay()
	set src in usr
	if(!ishuman(usr)) return

	if(!usr.canmove || usr.stat || usr.is_mob_restrained() || !usr.loc || !isturf(usr.loc))
		to_chat(usr, SPAN_WARNING("Not right now!"))
		return

	to_chat(usr, SPAN_NOTICE("You [flags_marine_helmet & HELMET_GARB_OVERLAY? "hide" : "show"] the helmet garb."))
	flags_marine_helmet ^= HELMET_GARB_OVERLAY
	update_icon()

	//AND THIS LINE
//END HEAD TEMPLATE

//MASK TEMPLATE (for masks)  ONLY TAKE NAME, DESC, ICON_STATE, ITEM_STATE,  AND ITEM_COLOR.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/mask/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null
	//DON'T GRAB STUFF BETWEEN THIS LINE
	flags_inventory = ALLOWREBREATH
	flags_inv_hide = HIDEEARS|HIDEEYES|HIDEFACE
	flags_cold_protection = BODY_FLAG_HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	//AND THIS LINE

//END MASK TEMPLATE

//SUIT TEMPLATE (for armor/exosuit)  ONLY TAKE NAME, DESC, ICON_STATE, AND ITEM_STATE.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/suit/storage/marine/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null
	flags_atom = FPRINT|CONDUCT|NO_NAME_OVERRIDE|NO_SNOW_TYPE
	//DON'T GRAB STUFF BETWEEN THIS LINE
	icon = 'icons/obj/items/clothing/suits.dmi'
	icon_override = 'icons/mob/humans/onmob/suit_0.dmi'  //Don't fuck with this in the future please.
	flags_inventory = BLOCKSHARPOBJ
	flags_marine_armor = NO_FLAGS

//LIGHT SUIT TEMPLATE (for armor/exosuit)  ONLY TAKE NAME, DESC, ICON_STATE, AND ITEM_STATE.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/suit/storage/marine/light/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null
	flags_atom = FPRINT|CONDUCT|NO_NAME_OVERRIDE|NO_SNOW_TYPE
	//DON'T GRAB STUFF BETWEEN THIS LINE
	icon = 'icons/obj/items/clothing/suits.dmi'
	icon_override = 'icons/mob/humans/onmob/suit_0.dmi'  //Don't fuck with this in the future please.
	flags_inventory = BLOCKSHARPOBJ
	flags_marine_armor = NO_FLAGS

/obj/item/clothing/suit/storage/marine/fluff/verb/toggle_squad_markings()
	set src in usr
	if(!ishuman(usr)) return

	if(!usr.canmove || usr.stat || usr.is_mob_restrained() || !usr.loc || !isturf(usr.loc))
		to_chat(usr, SPAN_WARNING("Not right now!"))
		return

	to_chat(usr, SPAN_NOTICE("You [flags_marine_armor & ARMOR_SQUAD_OVERLAY? "hide" : "show"] the squad markings."))
	flags_marine_armor ^= ARMOR_SQUAD_OVERLAY
	usr.update_inv_wear_suit()

/obj/item/clothing/suit/storage/marine/fluff/verb/toggle_shoulder_lamp()
	set src in usr
	if(!ishuman(usr)) return

	if(!usr.canmove || usr.stat || usr.is_mob_restrained() || !usr.loc || !isturf(usr.loc))
		to_chat(usr, SPAN_WARNING("Not right now!"))
		return

	to_chat(usr, SPAN_NOTICE("You [flags_marine_armor & ARMOR_LAMP_OVERLAY? "hide" : "show"] the shoulder lamp."))
	flags_marine_armor ^= ARMOR_LAMP_OVERLAY
	update_icon(usr)


	//AND THIS LINE
//END SUIT TEMPLATE

//FEET TEMPLATE (for shoes)  ONLY TAKE NAME, DESC, ICON_STATE, ITEM_STATE,  AND ITEM_COLOR.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/shoes/marine/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null
//END FEET TEMPLATE

/obj/item/storage/backpack/marine/fluff
	xeno_types = null

/obj/item/storage/backpack/marine/satchel/fluff
	xeno_types = null

/obj/item/clothing/gloves/marine/fluff   //MARINE GLOVES TEMPLATE
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	icon_state = null
	item_state = null

/obj/item/clothing/glasses/fluff
	flags_inventory = COVEREYES

//UNIFORM TEMPLATE (for uniforms/jumpsuits)  ONLY TAKE NAME, DESC, ICON_STATE, ITEM_STATE,  AND ITEM_COLOR.  Make a copy of those, and put the ckey of the person at the end after fluff
/obj/item/clothing/under/marine/fluff
	name = "ITEM NAME"
	desc = "ITEM DESCRIPTION.  DONOR ITEM" //Add UNIQUE if Unique
	flags_atom = FPRINT|NO_NAME_OVERRIDE|NO_SNOW_TYPE
	icon_state = null
	item_state = null
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	//DON'T GRAB STUFF BETWEEN THIS LINE
	//AND THIS LINE
