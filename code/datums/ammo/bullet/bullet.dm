/*
//======
					Default Ammo
//======
*/
//Only when things screw up do we use this as a placeholder.
/datum/ammo/bullet
	name = "default bullet"
	icon_state = "bullet"
	headshot_state = HEADSHOT_OVERLAY_LIGHT
	flags_ammo_behavior = AMMO_BALLISTIC
	sound_hit  = "ballistic_hit"
	sound_armor  = "ballistic_armor"
	sound_miss  = "ballistic_miss"
	sound_bounce = "ballistic_bounce"
	sound_shield_hit = "ballistic_shield_hit"

	accurate_range_min = 0
	damage = 10
	shrapnel_chance = SHRAPNEL_CHANCE_TIER_1
	shrapnel_type = /obj/item/shard/shrapnel
	shell_speed = AMMO_SPEED_TIER_4

/datum/ammo/bullet/proc/handle_battlefield_execution(datum/ammo/firing_ammo, mob/living/hit_mob, obj/projectile/firing_projectile, mob/living/user, obj/item/weapon/gun/fired_from)
	SIGNAL_HANDLER

	if(!user || hit_mob == user || user.zone_selected != "head" || user.a_intent != INTENT_HARM || !ishuman_strict(hit_mob))
		return

	if(!skillcheck(user, SKILL_EXECUTION, SKILL_EXECUTION_TRAINED))
		to_chat(user, SPAN_DANGER("You don't know how to execute someone correctly."))
		return

	var/mob/living/carbon/human/execution_target = hit_mob

	if(execution_target.status_flags & PERMANENTLY_DEAD)
		to_chat(user, SPAN_DANGER("[execution_target] has already been executed!"))
		return

	INVOKE_ASYNC(src, PROC_REF(attempt_battlefield_execution), src, execution_target, firing_projectile, user, fired_from)

	return COMPONENT_CANCEL_AMMO_POINT_BLANK

/datum/ammo/bullet/proc/attempt_battlefield_execution(datum/ammo/firing_ammo, mob/living/carbon/human/execution_target, obj/projectile/firing_projectile, mob/living/user, obj/item/weapon/gun/fired_from)
	user.affected_message(execution_target,
		SPAN_HIGHDANGER("You aim \the [fired_from] at [execution_target]'s head!"),
		SPAN_HIGHDANGER("[user] aims \the [fired_from] directly at your head!"),
		SPAN_DANGER("[user] aims \the [fired_from] at [execution_target]'s head!"))

	user.next_move += 1.1 SECONDS //PB has no click delay; readding it here to prevent people accidentally queuing up multiple executions.

	if(!do_after(user, 1 SECONDS, INTERRUPT_ALL, BUSY_ICON_HOSTILE) || !user.Adjacent(execution_target))
		fired_from.delete_bullet(firing_projectile, TRUE)
		return

	if(!(fired_from.flags_gun_features & GUN_SILENCED))
		playsound(user, fired_from.fire_sound, fired_from.firesound_volume, FALSE)
	else
		playsound(user, fired_from.fire_sound, 25, FALSE)

	shake_camera(user, 1, 2)

	execution_target.apply_damage(damage * 3, BRUTE, "head", no_limb_loss = TRUE, permanent_kill = TRUE) //Apply gobs of damage and make sure they can't be revived later...
	execution_target.apply_damage(200, OXY) //...fill out the rest of their health bar with oxyloss...
	execution_target.death(create_cause_data("execution", user)) //...make certain they're properly dead...
	shake_camera(execution_target, 3, 4)
	execution_target.update_headshot_overlay(headshot_state) //...and add a gory headshot overlay.

	execution_target.visible_message(SPAN_HIGHDANGER(uppertext("[execution_target] WAS EXECUTED!")),
		SPAN_HIGHDANGER("You WERE EXECUTED!"))

	user.count_niche_stat(STATISTICS_NICHE_EXECUTION, 1, firing_projectile.weapon_cause_data?.cause_name)

	var/area/execution_area = get_area(execution_target)

	msg_admin_attack(FONT_SIZE_HUGE("[key_name(usr)] has battlefield executed [key_name(execution_target)] in [get_area(usr)] ([usr.loc.x],[usr.loc.y],[usr.loc.z])."), usr.loc.x, usr.loc.y, usr.loc.z)
	log_attack("[key_name(usr)] battlefield executed [key_name(execution_target)] at [execution_area.name].")

	if(flags_ammo_behavior & AMMO_EXPLOSIVE)
		execution_target.gib()

/datum/ammo/bullet/on_hit_obj(obj/O, obj/projectile/P, mob/user)
	if(!istype(O, /obj/vehicle/multitile))
		if(prob(5))
			user.visible_message(SPAN_BOLDWARNING("[src] bounces off of the [O]!"))
			create_shrapnel(get_turf(O), 1, , ,/datum/ammo/bullet/shrapnel, P.weapon_cause_data)
			var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
			s.set_up(3, 1, src)
			s.start()
			return
	if(istype(O, /obj/vehicle/multitile/civvan))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/civtruck))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/van))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/atruck))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/miltruck))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/van/miljeep))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/crane))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/box_van))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	if(istype(O, /obj/vehicle/multitile/clf_van))
		var/obj/vehicle/multitile/M = O
		playsound(M, 'sound/effects/Glassbr3.ogg', 50)
		M.munition_interior_bullet_effect(cause_data = create_cause_data("Vehicle Spalling"))
		M.ex_act(25, P.dir, P.weapon_cause_data, 10)
		return
	return ..()

/datum/ammo/bullet/on_hit_mob(mob/M, obj/projectile/P, mob/user)
	shake_camera(M, 3, 1)
	var/mob/living/carbon/human/target_human = M
	if(target_human)
		if(target_human.wear_suit)
			if(prob(5))
				if(istype(target_human.wear_suit, /obj/item/clothing/suit/storage/marine))
					user.visible_message(SPAN_BOLDWARNING("Fragments of shrapnel from [src] spray off of [M]'s armor!"))
					create_shrapnel(get_turf(M), 3, , ,/datum/ammo/bullet/shrapnel, P.weapon_cause_data)

/datum/ammo/bullet/on_hit_turf(turf/T, obj/projectile/P, mob/user)
	if(prob(5))
		if(T.density)
			user.visible_message(SPAN_BOLDWARNING("[src] bounces off of the [T]!"))
			create_shrapnel(get_turf(T), 1, , ,/datum/ammo/bullet/shrapnel, P.weapon_cause_data)

