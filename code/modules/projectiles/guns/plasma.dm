//-------------------------------------------------------

/obj/item/weapon/gun/plasma
	reload_sound = 'sound/weapons/gun_rifle_reload.ogg'
	cocked_sound = 'sound/weapons/gun_cocked2.ogg'

	flags_equip_slot = SLOT_BACK
	w_class = SIZE_LARGE
	force = 5
	flags_gun_features = GUN_CAN_POINTBLANK
	gun_category = GUN_CATEGORY_RIFLE
	aim_slowdown = SLOWDOWN_ADS_RIFLE
	wield_delay = WIELD_DELAY_NORMAL

/obj/item/weapon/gun/plasma/Initialize(mapload, spawn_empty)
	. = ..()
	if(current_mag && current_mag.current_rounds > 0) load_into_chamber()

/obj/item/weapon/gun/plasma/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_5)
	set_burst_amount(BURST_AMOUNT_TIER_3)
	set_burst_delay(FIRE_DELAY_TIER_11)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_6
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/plasma/unique_action(mob/user)
	toggle_gun_safety(user)


//-------------------------------------------------------
//am35

// /obj/item/weapon/gun/plasma/am35
// 	name = "\improper a-m35 Phased Infantry Rifle"
// 	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire. Use of this mode is not recommended at longer ranges as the magnetic field does not receive sufficient time to re-focus the plasma stream, leading to a lower accuracy at range. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
// 	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-35 is a Hyperdyne developed plasma rifle commonly used by well funded mercenries the galaxy over. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat, and so the weapon has not seen much use outside of niche marksmen assignments. "
// 	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
// 	icon_state = "a-m36"
// 	item_state = "a-m36"
// 	muzzle_flash = "muzzle_flash_blue"
// 	fire_sound = 'sound/weapons/plasmagun.mp3'
// 	reload_sound = 'sound/weapons/handling/m41_reload.ogg'
// 	unload_sound = 'sound/weapons/handling/m41_unload.ogg'
// 	current_mag = /obj/item/ammo_magazine/rifle/am35
// 	flags_equip_slot = NO_FLAGS
// 	attachable_allowed = list(
// 		/obj/item/attachable/bayonet,
// 		/obj/item/attachable/bayonet/upp,
// 		/obj/item/attachable/bayonet/co2,
// 		/obj/item/attachable/reddot,
// 		/obj/item/attachable/reflex,
// 		/obj/item/attachable/flashlight,
// 		/obj/item/attachable/heavy_barrel,
// 		/obj/item/attachable/magnetic_harness,
// 		/obj/item/attachable/scope,
// 	)
// 	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY
// 	map_specific_decoration = FALSE
// 	aim_slowdown = SLOWDOWN_ADS_QUICK

// /obj/item/weapon/gun/plasma/am35/set_gun_attachment_offsets()
// 	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 15, "rail_y" = 21, "under_x" = 24, "under_y" = 13, "stock_x" = 24, "stock_y" = 13)

// 	starting_attachment_types = list(/obj/item/attachable/scope,)

// /obj/item/weapon/gun/plasma/am35/set_gun_config_values()
// 	..()
// 	fire_delay = FIRE_DELAY_TIER_1
// 	burst_amount = BURST_AMOUNT_TIER_2
// 	burst_delay = FIRE_DELAY_TIER_12
// 	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
// 	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
// 	scatter = SCATTER_AMOUNT_TIER_8
// 	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
// 	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
// 	damage_mult = BASE_BULLET_DAMAGE_MULT
// 	recoil_unwielded = RECOIL_AMOUNT_TIER_1

// /obj/item/weapon/gun/plasma/am35/rmc
// 	name = "\improper a-m35 Marksman Phased infantry Rifle"
// 	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire. Use of this mode is not recommended at longer ranges as the magnetic field does not receive sufficient time to re-focus the plasma stream, leading to a lower accuracy at range. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
// 	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-35 is a Hyperdyne developed plasma rifle commonly used by TWE marksmen, and well funded PMC contractors. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat, and so the weapon has not seen much use outside of niche marksmen assignments."
// 	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
// 	icon_state = "a-m35"
// 	item_state = "a-m36"

// /obj/item/weapon/gun/plasma/am36
// 	name = "\improper a-m36 experimental Phased infantry Rifle"
// 	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire, and fully automatic fire. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
// 	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-36 is a fully automatic version of Hyperdyne's am-35 plasma rifle, and is occasionally used by very well funded PMC contractors. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat. This combined with high costs has resigned the weapon to being more of a novel choice for overpayed mercenaries than any real military applications."
// 	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
// 	icon_state = "a-m36"
// 	item_state = "a-m36"
// 	muzzle_flash = "muzzle_flash_blue"
// 	fire_sound = 'sound/weapons/plasmagun.mp3'
// 	reload_sound = 'sound/weapons/handling/m41_reload.ogg'
// 	unload_sound = 'sound/weapons/handling/m41_unload.ogg'
// 	current_mag = /obj/item/ammo_magazine/rifle/am36
// 	flags_equip_slot = NO_FLAGS
// 	attachable_allowed = list(
// 		/obj/item/attachable/bayonet,
// 		/obj/item/attachable/bayonet/upp,
// 		/obj/item/attachable/bayonet/co2,
// 		/obj/item/attachable/reddot,
// 		/obj/item/attachable/reflex,
// 		/obj/item/attachable/flashlight,
// 		/obj/item/attachable/heavy_barrel,
// 		/obj/item/attachable/magnetic_harness,
// 	)
// 	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY
// 	map_specific_decoration = FALSE
// 	aim_slowdown = SLOWDOWN_ADS_QUICK
// 	start_automatic = TRUE

// /obj/item/weapon/gun/plasma/am36/set_gun_attachment_offsets()
// 	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 15, "rail_y" = 21, "under_x" = 24, "under_y" = 13, "stock_x" = 24, "stock_y" = 13)

// /obj/item/weapon/gun/plasma/am36/set_gun_config_values()
// 	..()
// 	fire_delay = FIRE_DELAY_TIER_7
// 	burst_amount = BURST_AMOUNT_TIER_2
// 	burst_delay = FIRE_DELAY_TIER_7
// 	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
// 	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
// 	scatter = SCATTER_AMOUNT_TIER_8
// 	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
// 	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
// 	damage_mult = BASE_BULLET_DAMAGE_MULT
// 	recoil_unwielded = RECOIL_AMOUNT_TIER_1

//-------------------------------------------------------
// xm99a
/obj/item/weapon/gun/plasma/xm99a
	name = "XXM99A1"
	desc = "As an experimental weapon, the XM99A1 sees limited use within the United States Colonial Marine Corps. In combat the weapon frequently suffers from its high energy draw to pellet count."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/uscm/energy_weapons.dmi'
	item_icons = list(
		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/energy_weapons_lefthand.dmi',
		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/weapons/guns/energy_weapons_righthand.dmi'
	)
	icon_state = "xm99a"
	item_state = "xm99a"
	current_mag = /obj/item/ammo_magazine/rifle/xm99a
	map_specific_decoration = FALSE
	fire_sound = 'sound/weapons/pred_plasmacaster_fire.ogg'
	unload_sound = 'sound/weapons/handling/flamer_unload.ogg'
	reload_sound = 'sound/weapons/handling/flamer_reload.ogg'
	mouse_pointer = 'icons/effects/mouse_pointer/smartgun_mouse.dmi'
	flags_equip_slot = NO_FLAGS
	w_class = SIZE_HUGE
	force = 20
	wield_delay = WIELD_DELAY_FAST
	aim_slowdown = SLOWDOWN_ADS_SPECIALIST
	unacidable = TRUE
	explo_proof = TRUE
	flags_gun_features = GUN_SPECIALIST|GUN_WIELDED_FIRING_ONLY|GUN_AMMO_COUNTER|GUN_CAN_POINTBLANK
	muzzle_flash = "muzzle_flash_blue"
	muzzle_flash_color = COLOR_MUZZLE_BLUE
	auto_retrieval_slot = WEAR_J_STORE

	attachable_allowed = list(
		/obj/item/attachable/scope/mini,
		/obj/item/attachable/scope/mini_iff,
		/obj/item/attachable/gyro,
		/obj/item/attachable/flashlight/grip,
		)

	var/obj/item/smartgun_battery/battery = null
	/// Whether the smartgun drains the battery (Ignored if requires_battery is false)
	var/requires_power = TRUE
	/// Whether the smartgun requires a battery
	var/requires_battery = TRUE
	/// Whether the smartgun requires a harness to use
	var/requires_harness = TRUE
	var/drain = 3000

/obj/item/weapon/gun/plasma/xm99a/Initialize(mapload, ...)

	battery = new /obj/item/smartgun_battery(src)
	muzzle_flash = "muzzle_flash_blue"
	muzzle_flash_color = COLOR_MUZZLE_BLUE
	. = ..()
	AddComponent(/datum/component/iff_fire_prevention)
	update_icon()

/obj/item/weapon/gun/plasma/xm99a/Destroy()
	QDEL_NULL(battery)
	. = ..()

/obj/item/weapon/gun/plasma/xm99a/able_to_fire(mob/living/user)
	. = ..()
	if(.)
		if(!ishuman(user))
			return FALSE
		var/mob/living/carbon/human/H = user
		if(!skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_SMARTGUN) && !skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_ALL))
			balloon_alert(user, "insufficient skills")
			return FALSE
		if(requires_harness)
			if(!H.wear_suit || !(H.wear_suit.flags_inventory & SMARTGUN_HARNESS))
				balloon_alert(user, "harness required")
				return FALSE

/obj/item/weapon/gun/plasma/xm99a/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
	if(!requires_battery)
		return ..()

	if(battery)
		if(!requires_power)
			return ..()
		if(drain_battery())
			return ..()

/obj/item/weapon/gun/plasma/xm99a/proc/drain_battery(override_drain)

	var/actual_drain = (rand(drain / 2, drain) / 25)

	if(override_drain)
		actual_drain = (rand(override_drain / 2, override_drain) / 25)

	if(battery && battery.power_cell.charge > 0)
		if(battery.power_cell.charge > actual_drain)
			battery.power_cell.charge -= actual_drain
		else
			battery.power_cell.charge = 0
			to_chat(usr, SPAN_WARNING("[src] emits a low power warning and immediately shuts down!"))
			return FALSE
		return TRUE
	if(!battery || battery.power_cell.charge == 0)
		balloon_alert(usr, "low power")
		return FALSE
	return FALSE

/obj/item/weapon/gun/plasma/xm99a/get_examine_text(mob/user)
	. = ..()
	var/rounds = 0
	if(current_mag && current_mag.current_rounds)
		rounds = current_mag.current_rounds
	var/message = "[rounds ? "Ammo counter shows [rounds] round\s remaining." : "It's dry."]"
	. += message

	if(battery && get_dist(user, src) <= 1)
		. += "A small gauge on [battery] reads: Power: [battery.power_cell.charge] / [battery.power_cell.maxcharge]."

/obj/item/weapon/gun/plasma/xm99a/attackby(obj/item/attacking_object, mob/user)
	if(istype(attacking_object, /obj/item/smartgun_battery))
		var/obj/item/smartgun_battery/new_cell = attacking_object
		visible_message(SPAN_NOTICE("[user] swaps out the power cell in [src]."),
			SPAN_NOTICE("You swap out the power cell in [src] and drop the old one."))
		to_chat(user, SPAN_NOTICE("The new cell contains: [new_cell.power_cell.charge] power."))
		battery.update_icon()
		battery.forceMove(get_turf(user))
		battery = new_cell
		user.drop_inv_item_to_loc(new_cell, src)
		playsound(src, 'sound/machines/click.ogg', 25, 1)
		return

	return ..()

/obj/item/weapon/gun/plasma/xm99a/unique_action(mob/user)
	get_ammo_type_chambered(user)

/obj/item/weapon/gun/plasma/xm99a/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_1)
	set_burst_amount(FIRE_DELAY_TIER_10)
	set_burst_delay(FIRE_DELAY_TIER_8)
	accuracy_mult = BASE_ACCURACY_MULT
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_6
	scatter_unwielded = SCATTER_AMOUNT_TIER_2
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_2

/obj/item/weapon/gun/plasma/xm99a/scoped
	starting_attachment_types = list(/obj/item/attachable/scope/mini_iff, /obj/item/attachable/gyro)

//-------------------------------------------------------
// P.I.G.
// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun
// 	name = "\improper M78 P.I.G."
// 	desc = "The M78 Phased-Plasma Infantry Gun (P.I.G.) is an man-portable anti-armor weapon used by the United States Colonial Marine Corps"
// 	icon_state = "xm99a"
// 	item_state = "xm99a"
// 	unacidable = TRUE
// 	muzzle_flash = "muzzle_energy"
// 	fire_sound = 'sound/weapons/gun_sniper.ogg'
// 	current_mag = /obj/item/ammo_magazine/phased_plasma_infantry_gun
// 	force = 12
// 	wield_delay = WIELD_DELAY_HORRIBLE //Ends up being 1.6 seconds due to scope
// 	zoomdevicename = "scope"
// 	attachable_allowed = list()
// 	flags_gun_features = GUN_AUTO_EJECTOR|GUN_WIELDED_FIRING_ONLY
// 	map_specific_decoration = FALSE
// 	actions_types = list(/datum/action/item_action/phased_plasma_infantry_gun_start_charge, /datum/action/item_action/phased_plasma_infantry_gun_abort_charge)
// 	var/obj/item/plasmagun_powerpack/hydrogen_fuel_cell = null
// 	var/link_powerpack
// 	var/drain = 1000
// 	var/requires_plasmagun_powerpack
// 	var/requires_battery = TRUE
// 	var/requires_power = TRUE

// 	// Hellpullverizer ready or not??
// 	var/charged = FALSE


// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/able_to_fire()
// 	if(!ishuman(user)) return 0
// 	var/mob/living/carbon/human/H = user
// 	if(!skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_ALL))
// 		to_chat(user, SPAN_WARNING("You don't seem to know how to use [src]..."))
// 		return 0
// 	if ( !istype(H.back,/obj/item/plasmagun_powerpack))
// 		click_empty(H)
// 		return 0
// 	return charged

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/proc/start_charging(user)
// 	playsound(user, 'sound/weapons/xm99.mp3', 25, 0)
// 	if (charged)
// 		to_chat(user, SPAN_WARNING("Your Phased-plasma infantry Gun is already charged."))
// 		return

// 	to_chat(user, SPAN_WARNING("You start charging your Phased-plasma infantry Gun."))
// 	if (!do_after(user, 3 SECONDS, INTERRUPT_ALL, BUSY_ICON_HOSTILE))
// 		to_chat(user, SPAN_WARNING("You stop charging your Phased-plasma infantry Gun."))
// 		return

// 	to_chat(user, SPAN_WARNING("You finish charging your Phased-plasma infantry Gun."))

// 	charged = TRUE
// 	return

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/on_enter_storage()
// 	if (charged)
// 		abort_charge()
// 	. = ..()

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/proc/abort_charge(user)
// 	if (!charged)
// 		return
// 	charged = FALSE
// 	if (user)
// 		to_chat(user, SPAN_WARNING("You depower your Phased-plasma infantry Gun to store it."))
// 	return

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/handle_starting_attachment()
// 	..()
// 	var/obj/item/attachable/scope/S = new(src)
// 	S.hidden = TRUE
// 	S.flags_attach_features &= ~ATTACH_REMOVABLE
// 	S.Attach(src)
// 	update_attachable(S.slot)

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/set_gun_config_values()
// 	..()
// 	set_fire_delay(FIRE_DELAY_TIER_6*5)
// 	set_burst_amount(BURST_AMOUNT_TIER_1)
// 	accuracy_mult = BASE_ACCURACY_MULT * 3 //you HAVE to be able to hit
// 	scatter = SCATTER_AMOUNT_TIER_8
// 	damage_mult = BASE_BULLET_DAMAGE_MULT
// 	recoil = RECOIL_AMOUNT_TIER_5

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/unique_action(mob/user)
// 	if (in_chamber)
// 		to_chat(user, SPAN_WARNING("There's already a round chambered!"))
// 		return

// 	var/result = load_into_chamber()
// 	if (result)
// 		to_chat(user, SPAN_WARNING("You run the bolt on [src], chambering a round!"))
// 	else
// 		to_chat(user, SPAN_WARNING("You run the bolt on [src], but it's out of rounds!"))

// // normally, ready_in_chamber gets called by this proc. However, it never gets called because we override.
// // so we don't need to override ready_in_chamber, which is what makes the bullet and puts it in the chamber var.
// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/reload_into_chamber(mob/user)
// 	charged = FALSE
// 	in_chamber = null // blackpilled again
// 	return null

// /datum/action/item_action/phased_plasma_infantry_gun_start_charge
// 	name = "Start Charging"

// /datum/action/item_action/phased_plasma_infantry_gun_start_charge/action_activate()
// 	if (target)
// 		var/obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/TR = target
// 		TR.start_charging(owner)

// /datum/action/item_action/phased_plasma_infantry_gun_abort_charge
// 	name = "Abort Charge"

// /datum/action/item_action/phased_plasma_infantry_gun_abort_charge/action_activate()
// 	if (target)
// 		var/obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/TR = target
// 		TR.abort_charge(owner)

// /obj/item/ammo_magazine/phased_plasma_infantry_gun
// 	name = "\improper Phased-plasma Infantry Gun ammunition canister"
// 	desc = "A magazine ammo for the poggers Railgun."
// 	caliber = "1x1cm Cadmium Telluride pellets"
// 	handful_state = "vulture_bullet"
// 	icon_state = "cadcan" //basing this off of a devinart photo, no idea how accurate it is but you try making a canister of cadmium telluride pellets, its not that easy lmao
// 	w_class = SIZE_LARGE
// 	flags_magazine = AMMUNITION_CANNOT_REMOVE_BULLETS
// 	max_rounds = 30
// 	default_ammo = /datum/ammo/rocket/ap/anti_tank/pig
// 	gun_type = /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun

// /datum/ammo/rocket/ap/anti_tank/pig
// 	name = "Cadmium Telluride pellet"
// 	damage_falloff = 0
// 	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SNIPER|AMMO_IGNORE_COVER
// 	accurate_range_min = 4
// 	icon_state = "emitter"
// 	accuracy = HIT_ACCURACY_TIER_8
// 	accurate_range = 32
// 	max_range = 32
// 	scatter = 0
// 	damage = 3*100
// 	penetration= ARMOR_PENETRATION_TIER_10
// 	shell_speed = AMMO_SPEED_TIER_6
// 	damage_falloff = 0

// /obj/item/plasmagun_powerpack
// 	name = "\improper M78 Phased-plasma Infantry Gun battery bank"
// 	desc = "A heavy reinforced backpack with support equipment and power cells for the M56 Smartgun System."
// 	icon_state = "rto_backpack"
// 	item_state = "rto_backpack"
// 	icon = 'icons/obj/items/clothing/backpack/backpacks_by_faction/UA.dmi'
// 	item_icons = list(
// 		WEAR_L_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_lefthand.dmi',
// 		WEAR_R_HAND = 'icons/mob/humans/onmob/inhands/clothing/backpacks_righthand.dmi',
// 		WEAR_BACK = 'icons/mob/humans/onmob/clothing/back/backpacks_by_faction/UA.dmi'
// 	)
// 	flags_atom = FPRINT|CONDUCT
// 	flags_equip_slot = SLOT_WAIST
// 	w_class = SIZE_HUGE
// 	var/obj/item/cell/pcell = null
// 	var/reloading = 0


// /obj/item/plasmagun_powerpack/New()
// 	..()
// 	pcell = new /obj/item/cell/hydrogen_fuel_cell(src)



// /obj/item/plasmagun_powerpack/attackby(/obj/item/A as obj, mob/user as mob)
// 	if(istype(A,/obj/item/cell))
// 		var/obj/item/cell/C = A
// 		visible_message("[user.name] swaps out the power cell in the [src.name].","You swap out the power cell in the [src] and drop the old one.")
// 		to_chat(user, "The new cell contains: [C.charge] power.")
// 		pcell.forceMove(get_turf(user))
// 		pcell = C
// 		user.drop_inv_item_to_loc(C, src)
// 		playsound(src,'sound/machines/click.ogg', 25, 1)
// 	else
// 		..()

// /obj/item/plasmagun_powerpack/examine(mob/user)
// 	..()
// 	if (get_dist(user, src) <= 1)
// 		if(pcell)
// 			to_chat(user, "A small gauge in the corner reads: Power: [pcell.charge] / [pcell.maxcharge].")

// /obj/item/plasmagun_powerpack/proc/drain_powerpack(drain = 0, /obj/item/cell/c)
// 	var/actual_drain = (rand(drain/2,drain)/25)
// 	if(c && c.charge > 0)
// 		if(c.charge > actual_drain)
// 			c.charge -= actual_drain
// 		else
// 			c.charge = 0
// 			to_chat(usr, SPAN_WARNING("[src] emits a low power warning and immediately shuts down!"))
// 		return TRUE
// 	if(!c || c.charge == 0)
// 		to_chat(usr, SPAN_WARNING("[src] emits a low power warning and immediately shuts down!"))
// 		return FALSE
// 	return FALSE

//  /// for the gun///


// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/able_to_fire(mob/living/user)
// 	. = ..()
// 	if(.)
// 		if(!ishuman(user)) return 0
// 		var/mob/living/carbon/human/H = user
// 		if(!skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_ALL))
// 			to_chat(user, SPAN_WARNING("You don't seem to know how to use [src]..."))
// 			return 0
// 		if ( !istype(H.belt,/obj/item/plasmagun_powerpack))
// 			click_empty(H)
// 			return 0


// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/Fire(atom/target, mob/living/user, params, reflex = 0, dual_wield)
// 	if(!powerpack)
// 		if(!link_powerpack(user))
// 			click_empty(user)
// 			unlink_powerpack()
// 			return


// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/proc/link_powerpack(/mob/user)
// 	if(!QDELETED(user) && !QDELETED(user.back))
// 		if(istype(user.back, /obj/item/plasmagun_powerpack))
// 			powerpack = user.back
// 			return TRUE
// 	return FALSE

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/proc/unlink_powerpack()
// 	powerpack = null

// /obj/item/weapon/gun/plasma/phased_plasma_infantry_gun/able_to_fire(mob/living/user)
// 	. = ..()
// 	if(.)
// 		if(!ishuman(user)) return 0
// 		var/mob/living/carbon/human/H = user
// 		if(!skillcheckexplicit(user, SKILL_SPEC_WEAPONS, SKILL_SPEC_ALL))
// 			to_chat(user, SPAN_WARNING("You don't seem to know how to use [src]..."))
// 			return 0
// 		if ( !istype(H.back,/obj/item/plasmagun_powerpack))
// 			click_empty(H)
// 			return 0
