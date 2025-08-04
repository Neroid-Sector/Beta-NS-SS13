/datum/ammo/bullet/re700
	name = "rotary cannon bullet"
	icon_state = "autocannon"
	damage_falloff = 0
	flags_ammo_behavior = AMMO_BALLISTIC

	accuracy = HIT_ACCURACY_TIER_7
	scatter = 0
	damage = 70
	damage_var_high = PROJECTILE_VARIANCE_TIER_8
	penetration = ARMOR_PENETRATION_TIER_10
	accurate_range = 10
	max_range = 12
	shell_speed = AMMO_SPEED_TIER_6

/datum/ammo/bullet/re700/he
	name = "rotary cannon bullet"
	icon_state = "autocannon"
	damage_falloff = 0
	flags_ammo_behavior = AMMO_BALLISTIC

	accuracy = HIT_ACCURACY_TIER_7
	scatter = 0
	damage = 70
	damage_var_high = PROJECTILE_VARIANCE_TIER_8
	penetration = ARMOR_PENETRATION_TIER_10
	accurate_range = 10
	max_range = 12
	shell_speed = AMMO_SPEED_TIER_6

/datum/ammo/bullet/re700/he/on_hit_mob(mob/M, obj/projectile/P)
	cell_explosion(get_turf(M), 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)

/datum/ammo/bullet/re700/he/on_hit_obj(obj/O, obj/projectile/P)
	cell_explosion(get_turf(O), 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)

/datum/ammo/bullet/re700/he/on_hit_turf(turf/T, obj/projectile/P)
	if(T.density)
		cell_explosion(T, 80, 40, EXPLOSION_FALLOFF_SHAPE_LINEAR, P.dir, P.weapon_cause_data)
