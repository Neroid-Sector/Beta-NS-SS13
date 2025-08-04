/obj/item/hardpoint/primary
	name = "primary hardpoint"
	desc = "Main big gun"

	slot = HDPT_PRIMARY

	damage_multiplier = 0.15

	activatable = TRUE

// Technical MG
/obj/item/hardpoint/primary/m56
	name = "\improper Stolen M56 Crows-nest"
	desc = "An m56 machinegun, and remote operated crowsnest system mounted on a non military combat vehicle."

	icon_state = "m56_cupola"
	disp_icon = "van"
	disp_icon_state = "van_cupola"
	activation_sounds = list('sound/weapons/gun_smartgun1.mp3', 'sound/weapons/gun_smartgun2.mp3', 'sound/weapons/gun_smartgun3.mp3', 'sound/weapons/gun_smartgun4.mp3')

	health = 300
	firing_arc = 360

	origins = list(0, 0)

	allowed_seat = VEHICLE_GUNNER

	ammo = new /obj/item/ammo_magazine/hardpoint/m56_cupola
	max_clips = 2

	use_muzzle_flash = FALSE

	scatter = 1
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = FIRE_DELAY_TIER_SG
