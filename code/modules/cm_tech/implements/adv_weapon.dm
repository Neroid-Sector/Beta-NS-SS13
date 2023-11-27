
/obj/item/techtree_advanced_weapon_kit
	name = "advanced weapon kit"
	desc = "It seems to be a kit to choose an advanced weapon"

	icon = 'icons/obj/items/items.dmi'
	icon_state = "wrench"

	var/gun_type = /obj/item/weapon/gun/shotgun/pump
	var/ammo_type = /obj/item/ammo_magazine/shotgun/buckshot
	var/ammo_type_count = 3


/obj/item/techtree_advanced_weapon_kit/attack_self(mob/user)
	if(!ishuman(user))
		return ..()
	var/mob/living/carbon/human/H = user

	new gun_type(get_turf(H))
	for (var/i in 1 to ammo_type_count)
		new ammo_type(get_turf(H))

	qdel(src)

/obj/item/techtree_advanced_weapon_kit/phased_plasma_infantry_gun
	name = "advanced weapon kit"
	desc = "It seems to be a kit to choose an advanced weapon"

	icon = 'icons/obj/items/items.dmi'
	icon_state = "wrench"

	gun_type = /obj/item/weapon/gun/rifle/phased_plasma_infantry_gun
	ammo_type = /obj/item/ammo_magazine/phased_plasma_infantry_gun
	ammo_type_count = 5


/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun
	name = "\improper Phased-Plasma Infantry Gun"
	desc = "A poggers hellbliterator"
	icon_state = "m42a"
	item_state = "m42a"
	unacidable = TRUE
	indestructible = 1
	muzzle_flash = "muzzle_energy"
	var/obj/item/plasmagun_battery/battery = TRUE
	/// Whether the smartgun drains the battery (Ignored if requires_battery is false)
	var/requires_power = TRUE
	/// Whether the smartgun requires a battery
	var/requires_battery = TRUE
	/// Whether the smartgun requires a harness to use
	var/requires_harness = TRUE

	fire_sound = 'sound/weapons/gun_sniper.ogg'
	current_mag = /obj/item/ammo_magazine/phased_plasma_infantry_gun
	force = 12
	wield_delay = WIELD_DELAY_HORRIBLE //Ends up being 1.6 seconds due to scope
	zoomdevicename = "scope"
	attachable_allowed = list()
	flags_gun_features = GUN_AUTO_EJECTOR|GUN_WIELDED_FIRING_ONLY
	map_specific_decoration = TRUE
	actions_types = list(/datum/action/item_action/phased_plasma_infantry_gun_start_charge, /datum/action/item_action/phased_plasma_infantry_gun_abort_charge)

	// Hellpullverizer ready or not??
	var/charged = FALSE


/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/able_to_fire()
	return charged

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/proc/start_charging(user)
	charge_sound  = 'sound/weapons/plasmaguncharge.ogg'
	if (charged)
		to_chat(user, SPAN_WARNING("Your Phased-plasma infantry Gun is already charged."))
		return

	to_chat(user, SPAN_WARNING("You start charging your Phased-plasma infantry Gun."))
	if (!do_after(user, 3 SECONDS, INTERRUPT_ALL, BUSY_ICON_HOSTILE))
		to_chat(user, SPAN_WARNING("You stop charging your PIG."))
		return

	to_chat(user, SPAN_WARNING("You finish charging your Phased-plasma infantry Gun."))

	charged = TRUE
	return

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/on_enter_storage()
	if (charged)
		abort_charge()
	. = ..()

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/proc/abort_charge(user)
	if (!charged)
		return
	charged = FALSE
	if (user)
		to_chat(user, SPAN_WARNING("You depower your Phased-plasma infantry Gun to store it."))
	return

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/handle_starting_attachment()
	..()
	var/obj/item/attachable/scope/S = new(src)
	S.hidden = TRUE
	S.flags_attach_features &= ~ATTACH_REMOVABLE
	S.Attach(src)
	update_attachable(S.slot)

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/set_gun_config_values()
	..()
	set_fire_delay(FIRE_DELAY_TIER_6*5)
	set_burst_amount(BURST_AMOUNT_TIER_1)
	accuracy_mult = BASE_ACCURACY_MULT * 3 //you HAVE to be able to hit
	scatter = SCATTER_AMOUNT_TIER_8
	damage_mult = BASE_BULLET_DAMAGE_MULT
	recoil = RECOIL_AMOUNT_TIER_5

/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/unique_action(mob/user)
	if (in_chamber)
		to_chat(user, SPAN_WARNING("There's already a round chambered!"))
		return

	var/result = load_into_chamber()
	if (result)
		to_chat(user, SPAN_WARNING("You run the bolt on [src], chambering a round!"))
	else
		to_chat(user, SPAN_WARNING("You run the bolt on [src], but it's out of rounds!"))

// normally, ready_in_chamber gets called by this proc. However, it never gets called because we override.
// so we don't need to override ready_in_chamber, which is what makes the bullet and puts it in the chamber var.
/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/reload_into_chamber(mob/user)
	charged = FALSE
	in_chamber = null // blackpilled again
	return null

/datum/action/item_action/phased_plasma_infantry_gun_start_charge
	name = "Start Charging"

/datum/action/item_action/phased_plasma_infantry_gun_start_charge/action_activate()
	if (target)
		var/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/TR = target
		TR.start_charging(owner)

/datum/action/item_action/phased_plasma_infantry_gun_abort_charge
	name = "Abort Charge"

/datum/action/item_action/phased_plasma_infantry_gun_abort_charge/action_activate()
	if (target)
		var/obj/item/weapon/gun/rifle/phased_plasma_infantry_gun/TR = target
		TR.abort_charge(owner)

/obj/item/ammo_magazine/phased_plasma_infantry_gun
	name = "\improper Phased-plasma Infantry Gun ammunition canister"
	desc = "A magazine ammo for the poggers Railgun."
	caliber = "1x1cm Cadmium Telluride pellets"
	handful_state = "vulture_bullet"
	icon_state = "cadcan" //basing this off of a devinart photo, no idea how accurate it is but you try making a canister of cadmium telluride pellets, its not that easy lmao
	w_class = SIZE_LARGE
	flags_magazine = AMMUNITION_CANNOT_REMOVE_BULLETS
	max_rounds = 30
	default_ammo = /datum/ammo/rocket/ap/anti_tank/pig
	gun_type = /obj/item/weapon/gun/rifle/phased_plasma_infantry_gun

/datum/ammo/rocket/ap/anti_tank/pig
	name = "Cadmium Telluride pellet"
	damage_falloff = 0
	flags_ammo_behavior = AMMO_BALLISTIC|AMMO_SNIPER|AMMO_IGNORE_COVER
	accurate_range_min = 4
	icon_state = "emitter"
	accuracy = HIT_ACCURACY_TIER_8
	accurate_range = 32
	max_range = 32
	scatter = 0
	damage = 3*100
	penetration= ARMOR_PENETRATION_TIER_10
	shell_speed = AMMO_SPEED_TIER_6
	damage_falloff = 0

/datum/ammo/bullet/sniper/railgun/on_hit_mob(mob/M, _unused)
	if (isxeno(M))
		M.apply_effect(1, SLOW)

/obj/item/plasmagun_battery
	name = "4mW hydrogen fuel cell"
	desc = "A standard-issue 9-volt lithium dry-cell battery, most commonly used within the USCMC to power smartguns. Per the manual, one battery is good for up to 50000 rounds and plugs directly into the smartgun's power receptacle, which is only compatible with this type of battery. Various auxiliary modes usually bring the round count far lower. While this cell is incompatible with most standard electrical system, it can be charged by common rechargers in a pinch. USCMC smartgunners often guard them jealously."

	icon = 'icons/obj/structures/machinery/power.dmi'
	icon_state = "smartguncell"
	force = 5
	throwforce = 5
	throw_speed = SPEED_VERY_FAST
	throw_range = 5
	w_class = SIZE_SMALL

	var/obj/item/cell/high/power_cell

/obj/item/plasmagun_battery/Initialize(mapload)
	. = ..()

	power_cell = new(src)

/obj/item/plasmagun_battery/get_examine_text(mob/user)
	. = ..()

	. += SPAN_NOTICE("The power indicator reads [power_cell.charge] charge out of [power_cell.maxcharge] total.")
