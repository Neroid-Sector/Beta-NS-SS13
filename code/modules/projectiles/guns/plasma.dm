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

/obj/item/weapon/gun/plasma/am35
	name = "\improper a-m35 Phased Infantry Rifle"
	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire. Use of this mode is not recommended at longer ranges as the magnetic field does not receive sufficient time to re-focus the plasma stream, leading to a lower accuracy at range. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-35 is a Hyperdyne developed plasma rifle commonly used by well funded mercenries the galaxy over. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat, and so the weapon has not seen much use outside of niche marksmen assignments. "
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "a-m36"
	item_state = "a-m36"
	muzzle_flash = "muzzle_flash_blue"
	fire_sound = 'sound/weapons/plasmagun.mp3'
	reload_sound = 'sound/weapons/handling/m41_reload.ogg'
	unload_sound = 'sound/weapons/handling/m41_unload.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/am35
	flags_equip_slot = NO_FLAGS
	attachable_allowed = list(
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/upp,
		/obj/item/attachable/bayonet/co2,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
		/obj/item/attachable/scope,
	)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY
	map_specific_decoration = FALSE
	aim_slowdown = SLOWDOWN_ADS_QUICK

/obj/item/weapon/gun/plasma/am35/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 15, "rail_y" = 21, "under_x" = 24, "under_y" = 13, "stock_x" = 24, "stock_y" = 13)

	starting_attachment_types = list(/obj/item/attachable/scope,)

/obj/item/weapon/gun/plasma/am35/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_1
	burst_amount = BURST_AMOUNT_TIER_2
	burst_delay = FIRE_DELAY_TIER_12
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_8
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_1

/obj/item/weapon/gun/plasma/am35/rmc
	name = "\improper a-m35 Marksman Phased infantry Rifle"
	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire. Use of this mode is not recommended at longer ranges as the magnetic field does not receive sufficient time to re-focus the plasma stream, leading to a lower accuracy at range. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-35 is a Hyperdyne developed plasma rifle commonly used by TWE marksmen, and well funded PMC contractors. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat, and so the weapon has not seen much use outside of niche marksmen assignments."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "a-m35"
	item_state = "a-m36"

/obj/item/weapon/gun/plasma/am36
	name = "\improper a-m36 experimental Phased infantry Rifle"
	desc = "A low powered plasma rifle. The gun features a togglable binary trigger for rapid fire, and fully automatic fire. Unlike a traditional rifle this weapon Uses vaporized cadmium telluride pellets."
	desc_lore = "Developed to combat heavier infantry and thin skinned armored vehicles the am-36 is a fully automatic version of Hyperdyne's am-35 plasma rifle, and is occasionally used by very well funded PMC contractors. Due to the reduced scale of the weapon, it struggles to pen the hides of even soft skin armored vehicles, but it does just fine against even the toughest infantry. Its larger brother the P.I.G. is a much better suited weapon for anti vehicle combat. This combined with high costs has resigned the weapon to being more of a novel choice for overpayed mercenaries than any real military applications."
	icon = 'icons/obj/items/weapons/guns/guns_by_faction/colony.dmi'
	icon_state = "a-m36"
	item_state = "a-m36"
	muzzle_flash = "muzzle_flash_blue"
	fire_sound = 'sound/weapons/plasmagun.mp3'
	reload_sound = 'sound/weapons/handling/m41_reload.ogg'
	unload_sound = 'sound/weapons/handling/m41_unload.ogg'
	current_mag = /obj/item/ammo_magazine/rifle/am36
	flags_equip_slot = NO_FLAGS
	attachable_allowed = list(
		/obj/item/attachable/bayonet,
		/obj/item/attachable/bayonet/upp,
		/obj/item/attachable/bayonet/co2,
		/obj/item/attachable/reddot,
		/obj/item/attachable/reflex,
		/obj/item/attachable/flashlight,
		/obj/item/attachable/heavy_barrel,
		/obj/item/attachable/magnetic_harness,
	)
	flags_gun_features = GUN_CAN_POINTBLANK|GUN_AMMO_COUNTER|GUN_WIELDED_FIRING_ONLY
	map_specific_decoration = FALSE
	aim_slowdown = SLOWDOWN_ADS_QUICK
	start_automatic = TRUE

/obj/item/weapon/gun/plasma/am36/set_gun_attachment_offsets()
	attachable_offset = list("muzzle_x" = 33, "muzzle_y" = 16,"rail_x" = 15, "rail_y" = 21, "under_x" = 24, "under_y" = 13, "stock_x" = 24, "stock_y" = 13)

/obj/item/weapon/gun/plasma/am36/set_gun_config_values()
	..()
	fire_delay = FIRE_DELAY_TIER_7
	burst_amount = BURST_AMOUNT_TIER_2
	burst_delay = FIRE_DELAY_TIER_7
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_4 + 2*HIT_ACCURACY_MULT_TIER_1
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_7
	scatter = SCATTER_AMOUNT_TIER_8
	accuracy_mult = BASE_ACCURACY_MULT + HIT_ACCURACY_MULT_TIER_5
	accuracy_mult_unwielded = BASE_ACCURACY_MULT - HIT_ACCURACY_MULT_TIER_10
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil_unwielded = RECOIL_AMOUNT_TIER_1
